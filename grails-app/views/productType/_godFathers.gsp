<g:form action="saveGodFathers" method="post">
    <g:hiddenField name="id" value="${productTypeInstance?.id}"/>
    <div class="fieldcontain ${hasErrors(bean: productTypeInstance, field: 'name', 'error')} ">
        <label for="godFathers">
            <g:message code="godFathers" default="GodFathers"/>
        </label>

        <div id="godFathersTree"></div>
        <g:hiddenField name="godFathers" value="${productTypeInstance?.godFathers?.collect {it.id}.join(",")}"/>
    </div>
    <script type="text/javascript">
        function addTree() {
            var productTypeTree = $("#godFathersTree").jstree({
                plugins:["themes", "json_data", "checkbox"],
                core:{
                    load_open:true,
                    rtl:true
                },
                checkbox:{
                    two_state:true
                },
                themes:{
                    theme:"default-rtl",
                    icons:false
                },
                json_data:{
                    ajax:{
                        cache:false,
                        url:'<g:createLink action="getProductTypes" controller="ProductType"/>',
                        type:'POST'
                    }
                }
            });
            productTypeTree.bind("loaded.jstree refresh.jstree", function (event, data) {
//                productTypeTree.jstree("open_all");
                var productTypes = $("[name=godFathers]").val().split(",");
                $(productTypes).each(function (index) {
                    productTypeTree.jstree('check_node', "#" + productTypes[index])
                })

            });
            productTypeTree.bind("change_state.jstree", function (e, d) {
                var tagName = d.args[0].tagName;
                var refreshing = d.inst.data.core.refreshing;
                if ((tagName == "A" || tagName == "INS") &&
                        (refreshing != true && refreshing != "undefined")) {
                    var checked = productTypeTree.jstree("get_checked");
                    var checkIds = checked.map(function () {
                        return this.id
                    }).get().join()
                    $("[name=godFathers]").val(checkIds)
                }
            });

        }
        addTree()
    </script>

    <fieldset class="buttons">
        <g:submitButton name="create" class="save"
                        value="${message(code: 'default.button.save.label', default: 'Save')}"/>
        <g:link class="list" controller="productType" action="list"><g:message code="productType.list"
                                                                               default="Product List"/></g:link>
    </fieldset>
</g:form>