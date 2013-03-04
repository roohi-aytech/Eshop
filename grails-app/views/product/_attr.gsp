<div class='fieldcontain'>
    <label for='at_${attributeType.id}'>${attributeType.name}</label>
    <span>
        <g:checkBox name="notAvailable_${attributeType.id}" checked="${attributeValue?.value=='N/A'}"/>N/A
    </span>
    %{--<g:if test="${attributeType.values}">--}%
        <g:select id="at_${attributeType.id}" name="at_${attributeType.id}" from="${attributeType?.values?.sort{it.value}}" optionKey="id" optionValue="value" noSelection="['':'']" value="${attributeValue?.id}"/>
        <input type="button" value="${message(code: "edit")}" onclick="editAttributeTypeValue${attributeType.id}()">
    %{--</g:if>--}%
    %{--<g:else>--}%
        %{--<g:if test="${attributeType?.attributeType=='Text'}">--}%
            %{--<g:textArea cols="50" rows="10" name="at_${attributeType.id}" value="${attributeValue}"/>--}%
        %{--</g:if>--}%
        %{--<g:else>--}%
            %{--<g:textField name="at_${attributeType.id}" value="${attributeValue}"/>--}%
        %{--</g:else>--}%
    %{--</g:else>--}%
    <input type="button" id="valuesBtn" value="${message(code: "add")}" onclick="addAttributeTypeValue${attributeType.id}()">
    <script type="text/javascript">
        function addAttributeTypeValue${attributeType.id}(){
            loadOverlay('<g:createLink controller="product" action="attrValueForm" params="['attributeTypeId': attributeType.id]"/>','<g:createLink action="saveAttributeValue" controller="product"/>',function(obj){
                if(obj){
                    var attypval = $("#at_${attributeType.id}")
                    if(attypval.is("select")){
                        attypval.append("<option value='"+obj.id+"'>"+obj.value+"</option>")
                        attypval.val(obj.id)
                    }
                    else{
                        var attypsel=$("<select></select>")
                        attypsel.attr("id","at_${attributeType.id}")
                        attypsel.attr("name","at_${attributeType.id}")
                        <g:if test="${attributeType.defaultValue}">
                            attypsel.append("<option value='${attributeType.defaultValue?.id}'>${attributeType.defaultValue}</option>")
                        </g:if>
                        attypsel.append("<option value='"+obj.id+"'>"+obj.value+"</option>")
                        attypsel.val(obj.id)
                        attypsel.insertAfter(attypval)
                        attypval.remove()
                    }
                }
            });
        }
        function editAttributeTypeValue${attributeType.id}(){
            var val=$("#at_${attributeType.id}").val()
            if(val>=0){
                loadOverlay('<g:createLink controller="product" action="attrValueForm" params="[attributeTypeId: attributeType.id]"/>&id='+val,'<g:createLink action="saveAttributeValue" controller="product"/>',function(obj){
                    $("#at_${attributeType.id}").find("option[value="+val+"]").html(obj.value)
                })
            }else{
                alert("<g:message code="please-select-value" />")
            }

        }
    </script>
</div>
