<div class='fieldcontain'>
    <label for='at_${attributeType.id}'>${attributeType.name}</label>
    <g:if test="${attributeType.values}">
        <g:select id="at_${attributeType.id}" name="at_${attributeType.id}" from="${attributeType?.optionValues}" optionKey="key" optionValue="val" noSelection="['':'']" value="${attributeValue}"/>
        <input type="button" value="${message(code: "edit")}" onclick="editAttributeTypeValue${attributeType.id}()">
    </g:if>
    <g:else>
        <g:if test="${attributeType?.attributeType=='Text'}">
            <g:textArea cols="50" rows="10" name="at_${attributeType.id}" value="${attributeValue}"/>
        </g:if>
        <g:else>
            <g:textField name="at_${attributeType.id}" value="${attributeValue}"/>
        </g:else>
    </g:else>
    <input type="button" id="valuesBtn" value="${message(code: "add")}" onclick="addAttributeTypeValue${attributeType.id}()">
    <script type="text/javascript">
        function addAttributeTypeValue${attributeType.id}(){
            loadOverlay('<g:createLink controller="product" action="attrValueForm" params="['attributeTypeId': attributeType.id]"/>','<g:createLink action="addAttributeValue" controller="product"/>',function(obj){
                if(obj){
                    var attypval = $("#at_${attributeType.id}")
                    if(attypval.is("select")){
                        attypval.append("<option value='"+obj.values+"'>"+obj.values+"</option>")
                        attypval.val(obj.values)
                    }
                    else{
                        var attypsel=$("<select></select>")
                        attypsel.attr("id","at_${attributeType.id}")
                        attypsel.attr("name","at_${attributeType.id}")
                        <g:if test="${attributeType.defaultValue}">
                            attypsel.append("<option>${attributeType.defaultValue}</option>")
                        </g:if>
                        attypsel.append("<option value='"+obj.values+"'>"+obj.values+"</option>")
                        attypsel.val(obj.values)
                        attypsel.insertAfter(attypval)
                        attypval.remove()
                    }
                }
            });
        }
        function editAttributeTypeValue${attributeType.id}(){
            var val=$("#at_${attributeType.id}").prop("selectedIndex")-1
            if(val>=0){
                loadOverlay('<g:createLink controller="product" action="attrValueForm" params="['attributeTypeId': attributeType.id]"/>&valueIndex='+val,'<g:createLink action="editAttributeValue" controller="product"/>',function(obj){
                    $("#at_${attributeType.id}").find("option:nth-child("+(val+2)+")").val(obj.values.replace(/\n/gm,"\\n")).html(obj.values)
                })
            }else{
                alert("<g:message code="please-select-value" />")
            }

        }
    </script>
</div>
