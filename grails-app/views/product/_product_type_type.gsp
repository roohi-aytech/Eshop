<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'type', 'error')} ">
    <label for="type.id">
        <g:message code="product.type.label" default="Type"/>
    </label>
    <g:select id="productTypeTypes" name="type.id" from="${productTypeTypes}" optionKey="id" optionValue="title"
              value="${productInstance?.type?.id}" noSelection="['': '']"/>
    <sec:ifAllGranted roles="${eshop.RoleHelper.ROLE_PRODUCT_TYPE_ADMIN}">
        <input type="button" value="${message(code: "application_delete")}" onclick="deleteProductTypeTypeValue()">
        <input type="button" value="${message(code: "edit")}" onclick="editProductTypeTypeValue()">
    </sec:ifAllGranted>
    <input type="button" id="valuesBtn" value="${message(code: "add")}" onclick="addProductTypeTypeValue()">
    <script type="text/javascript">
        function addProductTypeTypeValue() {
            loadOverlay('<g:createLink controller="product" action="typeForm"/>', '<g:createLink action="saveType" controller="product" params="[productInstanceId:productInstance?.id]"/>', function (obj) {
                if (obj) {
                    var attypval = $("#productTypeTypes")
                    attypval.append("<option value='" + obj.id + "'>" + obj.title + "</option>")
                    attypval.val(obj.id)
                }
            });
        }
        function editProductTypeTypeValue() {
            var val = $("#productTypeTypes").val()
            if (val) {
                loadOverlay('<g:createLink controller="product" action="typeForm"/>?id=' + val, '<g:createLink action="saveType" controller="product" params="[productInstanceId:productInstance?.id]"/>', function (obj) {
                    $("#productTypeTypes").find("option[value=" + val + "]").html(obj.title)
                })
            } else {
                alert("<g:message code="please-select-value" />")
            }

        }
        function deleteProductTypeTypeValue() {
            var val = $("#productTypeTypes").val()
            if (val) {
                if (confirm("<g:message code="default.button.delete.confirm.message" />")) {
                    $.ajax({
                        url:'<g:createLink action="deleteType" />',
                        data:{
                            id:val
                            ${ptid?",ptid:${ptid}":""}
                        },
                        type:'post'
                    }).success(function (res) {
                                if (res == '0') {
                                    $("#productTypeTypes").find("[value=" + val + "]").remove()
                                }
                                else {
                                    alert(res)
                                }
                            })
                }
            } else {
                alert("<g:message code="please-select-value" />")
            }

        }
    </script>
</div>