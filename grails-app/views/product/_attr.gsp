<div class='fieldcontain'>
    <label for='at_${attributeType.id}'>${attributeType.name}</label>
    <g:if test="${attributeType.values}">
        <g:select name="at_${attributeType.id}" from="${attributeType.values}" value="${attributeValue}" />
    </g:if>
    <g:else>
        <g:textField name="at_${attributeType.id}" value="${attributeValue}"/>
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
    </script>
</div>
