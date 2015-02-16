<div class="pull-right added-value-form-added-values">
    <g:each in="${addedValues}">
        <div onclick="selectAddedValue(${it?.id})" id="addedValue${it.id}" class="subType-${it.addedValueSubType?.id} thumbnail mediaholder small added-value-content">
            <img src="<g:createLink controller="image" params="[type:'addedValue']" id="${it?.id}"/>" alt="">
            <div class="title">
                ${it.name}
            </div>
            <div>
                <g:formatNumber number="${it.value}" type="number"/>
            </div>
        </div>
    </g:each>

</div>
<div class="pull-left added-value-form-added-actions">
    <g:if test="${addedValueType?.addedValueSubTypes}">
        <g:select name="addedValueSubTypes" from="${addedValueType?.addedValueSubTypes}" optionKey="id" optionValue="title" noSelection="['':message(code:'showAll')]"/>
    </g:if>
    <g:form name="addedValueSelect" controller="basket" action="addedValueSelectSubmit" enctype="multipart/form-data">
        <g:hiddenField name="typeId" value="${addedValueType.id}"/>
        <g:hiddenField name="addedValueId"/>
        <g:hiddenField name="basketItemId" value="${basketItemId}"/>

        <g:if test="${addedValueType.needDescription}">
            <div>
                <textarea name="description" placeholder="<g:message code="addedValue-desc" args="[addedValueType.title]" />"></textarea>
            </div>
        </g:if>
        <div>
            <input type="text" name="from" placeholder="<g:message code="addedValue.from" />">
        </div>
        <g:if test="${addedValueType.hasCustomImage}">
            <div>
                <input type="file" name="customImage" placeholder="<g:message code="addedValue.image.upload" />">
            </div>
        </g:if>
        <g:if test="${addedValueType.hasAddedValueCount}">
            <div>
                <input type="text" name="count" placeholder="<g:message code="count" />">
            </div>
        </g:if>
        <div>
            <div class="btn btn-success" onclick="selectAddedValueInstance()"><g:message code="select-added-value" /></div>
        </div>
    </g:form>
    <script type="application/javascript">
        $(function(){
            $('[name=addedValueSubTypes]').change(function(){

                if(this.value){
                    $('.added-value-content').hide();
                    $('.subType-'+this.value).show();
                }
                else{
                    $('.added-value-content').show();
                }
            });
        });
    </script>
</div>