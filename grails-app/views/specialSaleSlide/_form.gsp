<%@ page import="org.springframework.validation.FieldError; eshop.Slide" %>
<g:hasErrors bean="${specialSaleSlideInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${specialSaleSlideInstance}" var="error">
            <li <g:if test="${error in FieldError}">data-field-id="${error.field}"</g:if>><g:message
                    error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<script language="javascript" type="text/javascript">
    function clearAll() {
        var tree = $('#productTypes').combotree('tree');
        var nodes = tree.tree('getChecked', 'checked');
        for (var i = 0; i < nodes.length; i++)
            tree.tree('uncheck', nodes[i].target);

        $('#productTypesFieldContainer [name=productTypes]').remove();
        var input = $('<input class="combo-value" type="hidden" name="productTypes" value=""/>');
        $('#productTypesFieldContainer .combo').append(input);
    }

    function selectAll() {
        var tree = $('#productTypes').combotree('tree');
        var nodes = tree.tree('getChecked', 'unchecked');
        for (var i = 0; i < nodes.length; i++) {
            tree.tree('check', nodes[i].target);
            var input = $('<input class="combo-value" type="hidden" name="productTypes" value="' + nodes[i].id + '"/>');
            $('#productTypesFieldContainer .combo').append(input);
        }
    }
</script>

<g:hiddenField name="id" value="${specialSaleSlideInstance?.id}"/>
<g:hiddenField name="version" value="${specialSaleSlideInstance?.version}"/>

<div class="fieldcontain ${hasErrors(bean: specialSaleSlideInstance, field: 'price', 'error')} ">
    <label for="price">
        <g:message code="slide.price.label" default="Price"/>

    </label>
    <g:textField name="price" value="${specialSaleSlideInstance?.price}" />
</div>

<div class="fieldcontain ${hasErrors(bean: specialSaleSlideInstance, field: 'startDate', 'error')} ">
    <label for="startDate">
        <g:message code="specialSaleSlide.startDate.label" default="startDate"/>

    </label>
    <rg:datePicker name="startDate" value="${specialSaleSlideInstance?.startDate}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: specialSaleSlideInstance, field: 'finishDate', 'error')} ">
    <label for="finishDate">
        <g:message code="specialSaleSlide.finishDate.label" default="finishDate"/>

    </label>
    <rg:datePicker name="finishDate" value="${specialSaleSlideInstance?.finishDate}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: specialSaleSlideInstance, field: 'totalCount', 'error')} ">
    <label for="totalCount">
        <g:message code="specialSaleSlide.totalCount.label" default="totalCount"/>

    </label>
    <g:textField name="totalCount" value="${specialSaleSlideInstance?.totalCount}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: specialSaleSlideInstance, field: 'remainingCount', 'error')} ">
    <label for="remainingCount">
        <g:message code="specialSaleSlide.remainingCount.label" default="remainingCount"/>

    </label>
    <g:textField name="remainingCount" value="${specialSaleSlideInstance?.remainingCount}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: specialSaleSlideInstance, field: 'productTypes', 'error')} "
     id="productTypesFieldContainer">
    <label for="productTypes">
        <span style="padding-left: 20px;"><g:message code="slide.productTypes.label" default="Product Types"/></span>
        [<a onclick="selectAll();"><g:message code="selectAll"/></a>]
    [<a onclick="clearAll();"><g:message code="clearAll"/></a>]
    </label>

    <rg:tree bean="${specialSaleSlideInstance}" field="productTypes" relationField="parentProduct" width="340px"
             cascadeCheck="false"/>
</div>

<div class="fieldcontain ${hasErrors(bean: specialSaleSlideInstance, field: 'visibleOnFirstPage', 'error')} ">
    <label for="visibleOnFirstPage">
        <g:message code="slide.visibleOnFirstPage.label" default="Visible On First Page"/>

    </label>
    <g:checkBox name="visibleOnFirstPage" value="${specialSaleSlideInstance.visibleOnFirstPage}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: specialSaleSlideInstance, field: 'image', 'error')} required">
    <label for="image">
        <g:message code="slide.image.label" default="image"/>
    </label>
    <input type="file" id="image" name="image"/>
    <img src="<g:createLink controller="image" action="index" params="${[id: specialSaleSlideInstance?.id, type: 'specialSale']}"/>"
         style="max-width: 100px"/>
</div>

<div class="fieldcontain ${hasErrors(bean: specialSaleSlideInstance, field: 'extraImage1', 'error')} required">
    <label for="extraImage1">
        <g:message code="slide.extraImage1.label" default="extraImage1"/>
    </label>
    <input type="file" id="extraImage1" name="extraImage1"/>
    <img src="<g:createLink controller="image" action="index" params="${[id: specialSaleSlideInstance?.id, type: 'specialSale', role: 'e1']}"/>"
         style="max-width: 100px"/>
</div>

<div class="fieldcontain ${hasErrors(bean: specialSaleSlideInstance, field: 'extraImage2', 'error')} required">
    <label for="extraImage2">
        <g:message code="slide.extraImage2.label" default="extraImage2"/>
    </label>
    <input type="file" id="extraImage2" name="extraImage2"/>
    <img src="<g:createLink controller="image" action="index" params="${[id: specialSaleSlideInstance?.id, type: 'specialSale', role: 'e2']}"/>"
         style="max-width: 100px"/>
</div>

<div class="fieldcontain ${hasErrors(bean: specialSaleSlideInstance, field: 'extraImage3', 'error')} required">
    <label for="extraImage3">
        <g:message code="slide.extraImage3.label" default="image"/>
    </label>
    <input type="file" id="extraImage3" name="extraImage3"/>
    <img src="<g:createLink controller="image" action="index" params="${[id: specialSaleSlideInstance?.id, type: 'specialSale', role: 'e3']}"/>"
         style="max-width: 100px"/>
</div>

<div class="fieldcontain ${hasErrors(bean: specialSaleSlideInstance, field: 'extraLink1', 'error')} ">
    <label for="extraLink1">
        <g:message code="slide.extraLink1.label" default="extraLink1"/>

    </label>
    <g:textField name="extraLink1" value="${specialSaleSlideInstance?.extraLink1}" size="70"/>
</div>

<div class="fieldcontain ${hasErrors(bean: specialSaleSlideInstance, field: 'extraLink2', 'error')} ">
    <label for="extraLink2">
        <g:message code="slide.extraLink2.label" default="extraLink2"/>

    </label>
    <g:textField name="extraLink2" value="${specialSaleSlideInstance?.extraLink2}" size="70"/>
</div>

<div class="fieldcontain ${hasErrors(bean: specialSaleSlideInstance, field: 'extraLink3', 'error')} ">
    <label for="extraLink3">
        <g:message code="slide.extraLink3.label" default="extraLink3"/>

    </label>
    <g:textField name="extraLink3" value="${specialSaleSlideInstance?.extraLink3}" size="70"/>
</div>



