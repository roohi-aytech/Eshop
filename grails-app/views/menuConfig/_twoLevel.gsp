<div id="menu-tabs">
    <ul>
        <g:each in="${productTypes.groupBy {it.parentProduct}}" var="productTypeParent">
            <li><a href="#items_${productTypeParent.key.id}">${productTypeParent.key.name}</a></li>
        </g:each>
    </ul>
    <g:each in="${productTypes.groupBy {it.parentProduct}}" var="productTypeParent">
        <div id="items_${productTypeParent.key.id}">
            <div id="menu-tabs-sub-${productTypeParent.key.id}">
                <ul>
                    <g:each in="${productTypeParent.value}" var="productType">
                        <li><a href="#items_sub_${productType.id}">${productType.name}</a></li>
                    </g:each>
                </ul>
                <g:each in="${productTypeParent.value}" var="productType">
                    <g:each in="${1..6}" var="i">
                        <g:hiddenField name="column_${productType.id}_${i}" id="column_${productType.id}_${i}"/>
                    </g:each>
                    <div id="items_sub_${productType.id}">
                    <table>
                        <tbody>
                        <tr valign="top">
                            <td>
                                <div id="columnTree1_${productType.id}"></div>
                            </td>
                            <td>
                                <div id="columnTree2_${productType.id}"></div>
                            </td>
                            <td>
                                <div id="columnTree3_${productType.id}"></div>
                            </td>
                            <td>
                                <div id="columnTree4_${productType.id}"></div>
                            </td>
                            <td>
                                <div id="columnTree5_${productType.id}"></div>
                            </td>
                            <td>
                                <div id="columnTree6_${productType.id}"></div>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                    <div>
                        <g:each in="${1..5}" var="index">
                            <div class="fieldcontain ${hasErrors(bean: productType, field: "extraMenuImage${index}_${productType.id}", 'error')} ">
                                <label for="extraMenuImage${index}_${productType.id}">
                                    <g:message code="productType.extraMenuImage${index}.label" default="extraMenuImage${index}"/>
                                </label>
                                <input type="file" id="extraMenuImage${index}_${productType.id}"
                                       name="extraMenuImage${index}_${productType.id}"/>
                                <input type="hidden" id="extraMenuImage${index}deleted_${productType.id}"
                                       name="extraMenuImage${index}Deleted_${productType.id}" value=""/>
                                <img id="extraMenuImg${index}_${productType.id}" width="100px"
                                     src="${createLink(controller: 'image', params: [id: productType.id, type: 'productTypeMenu', role: "e${index}"])}"/>
                                <input type="button" value="<g:message code="delete"/>"
                                       onclick="deleteExtraMenuImage${index}_${productType.id}()">
                                <script type="text/javascript">
                                    function deleteExtraMenuImage${index}_${productType.id}() {
                                        if (confirm('<g:message code="default.button.delete.confirm.message" />')) {
                                            $("#mextraMenuImg${index}_${productType.id}").attr('src', '');
                                            $("#extraMenuImage${index}deleted_${productType.id}").val("true");
                                        }
                                    }
                                </script>
                            </div>
                        </g:each>
                        <g:set var="menuConfig" value="${eshop.MenuConfig.findByProductType(productType)}"/>
                        <div class="fieldcontain ${hasErrors(bean: productType, field: "maxBrandsCount", 'error')} ">
                            <label for="extraMenuImage${index}_${productType.id}">
                                <g:message code="menuConfig.maxBrandsCount.label" default="maxBrandsCount"/>
                            </label>
                            <g:textField name="maxBrandsCount_${productType.id}" value="${menuConfig.maxBrandsCount ?: 0}"/>
                        </div>
                    </div>
                </div>
                </g:each>
            </div>

        </div>

    </g:each>
</div>
<script language="javascript" type="text/javascript">
    $(function () {
        $("#menu-tabs").tabs({
            selected: 0
        });
        <g:each in="${productTypes.groupBy {it.parentProduct}}" var="productTypeParent">
            $("#menu-tabs-sub-${productTypeParent.key.id}").tabs({
                selected: 0
            });
        </g:each>
    });
</script>