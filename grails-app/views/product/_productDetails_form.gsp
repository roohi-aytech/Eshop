<g:form action="saveProductAndReturnToDetailsPage" params="${[curtab: 0, ptid: ptid]}">
    <g:render template="form"/>

    <fieldset class="buttons">
        <g:submitButton name="create" class="save" onclick="return checkProductType();"
                        value="${message(code: 'default.button.save.label', default: 'Save')}"/>
        <g:actionSubmit action="saveProductAndExit" name="createAndExit" class="save"
                        onclick="return checkProductType();"
                        value="${message(code: "default.button.save.and.exit.label", default: "Save And Exit")}"/>
        <g:actionSubmit action="saveProductAndNew" name="createAndNew" class="save" onclick="return checkProductType()"
                        value="${message(code: "default.button.save.and.new.label", default: "Save And New")}"/>
        <g:if test="${grailsApplication.config.copyProduct}">
            <g:actionSubmit action="saveProductAndCopy" name="createAndCopy" class="save"
                            onclick="return checkProductType()"
                            value="${message(code: "default.button.save.and.copy.label", default: "Save And Copy")}"/>
        </g:if>
        <g:link class="list" action="list" params="[ptid: ptid]"><g:message code="default.product.list"
                                                                            default="Product List"/></g:link>
    </fieldset>
</g:form>
<script type="text/javascript">
    function checkProductType() {
        var pt = $(document.getElementsByName("producttypes")).val();
        if (pt == "") {
            window.alert('لطفا نوع محصولات را وارد کنید');
            return false;
        }
        return true;
    }

    function addTree() {
        var buttons = $(".ui-dialog-content").dialog('option', 'buttons')
        var newButtons = {
            '<g:message code="save-and-edit-details"/>': function () {
                var r = $(".ui-dialog-content")
                r.ajaxSubmit({
                    url: r.attr('action'),
                    type: "post",
                    success: function (resp) {
                        if (resp == 0 || typeof resp == 'object') {
                            var r = $(".ui-dialog-content")
                            r.dialog("destroy");
                            r.remove()
                            window.location = '<g:createLink controller="product" action="productDetails"/>/' + resp.id;
                        } else {
                            var r = $(".ui-dialog-content")
                            r.html(resp);
                            r.dialog("open");
                        }
                    }
                })
                $(this).dialog("close");
            }
        }
        for (var button in buttons) {
            newButtons[button] = buttons[button]
        }
        $(".ui-dialog-content").dialog('option', 'buttons', newButtons)

        var productTypeTree = $("#productTypes").jstree({
            plugins: ["themes", "json_data", "checkbox"],
            core: {
                load_open: true,
                rtl: true
            },
            checkbox: {
                two_state: true
            },
            themes: {
                theme: "default-rtl",
                icons: false
            },
            json_data: {
                ajax: {
                    cache: false,
                    url: '<g:createLink action="getProductTypes" controller="ProductType"/>',
                    type: 'POST'
                }
            }
        });
        productTypeTree.bind("loaded.jstree refresh.jstree", function (event, data) {
//                productTypeTree.jstree("open_all");
            var val = $("[name=producttypes]").val()
            if (val) {
                var productTypes = $("[name=producttypes]").val().split(",");
                $(productTypes).each(function (index) {
                    productTypeTree.jstree('check_node', "#" + productTypes[index])
                })
            }

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
                $("[name=producttypes]").val(checkIds)
            }
        });

    }
    addTree()
</script>