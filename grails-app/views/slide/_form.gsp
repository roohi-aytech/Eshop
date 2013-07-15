<%@ page import="eshop.Slide" %>
<g:hasErrors bean="${slideInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${slideInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<script language="javascript" type="text/javascript">
    function clearAll(){
        var tree = $('#productTypes').combotree('tree');
        var nodes = tree.tree('getChecked', 'checked');
        for(var i = 0; i < nodes.length; i++)
            tree.tree('uncheck', nodes[i].target);

        $('#productTypesFieldContainer [name=productTypes]').remove();
        var input = $('<input class="combo-value" type="hidden" name="productTypes" value=""/>');
        $('#productTypesFieldContainer .combo').append(input);
    }

    function selectAll(){
        var tree = $('#productTypes').combotree('tree');
        var nodes = tree.tree('getChecked', 'unchecked');
        for(var i = 0; i < nodes.length; i++){
            tree.tree('check', nodes[i].target);
            var input = $('<input class="combo-value" type="hidden" name="productTypes" value="' + nodes[i].id + '"/>');
            $('#productTypesFieldContainer .combo').append(input);
        }
    }
</script>

<g:hiddenField name="id" value="${slideInstance?.id}" />
<g:hiddenField name="version" value="${slideInstance?.version}" />

<div class="fieldcontain ${hasErrors(bean: slideInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="slide.name.label" default="Name"/>

    </label>
    <g:textField name="name" value="${slideInstance?.name}" class="count-words" size="52"/>
</div>

<div class="fieldcontain ${hasErrors(bean: slideInstance, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="slide.description.label" default="Description"/>

    </label>
    <g:textArea cols="50" rows="5" name="description" value="${slideInstance?.description}" class="count-words"/>
</div>

<div class="fieldcontain ${hasErrors(bean: slideInstance, field: 'url', 'error')} ">
    <label for="url">
        <g:message code="slide.url.label" default="Url"/>

    </label>
    <g:textField name="url" value="${slideInstance?.url}" class="count-words" size="50"/>
</div>

<div class="fieldcontain ${hasErrors(bean: slideInstance, field: 'productTypes', 'error')} " id="productTypesFieldContainer">
    <label for="productTypes">
        <span style="padding-left: 20px;"><g:message code="slide.productTypes.label" default="Product Types"/></span>
        [<a onclick="selectAll();"><g:message code="selectAll"/></a>]
        [<a onclick="clearAll();"><g:message code="clearAll"/></a>]
    </label>

    <rg:tree bean="${slideInstance}" field="productTypes" relationField="parentProduct" width="340px" cascadeCheck="false"></rg:tree>
</div>

<div class="fieldcontain ${hasErrors(bean: slideInstance, field: 'visibleOnFirstPage', 'error')} ">
    <label for="visibleOnFirstPage">
        <g:message code="slide.visibleOnFirstPage.label" default="Visible On First Page"/>

    </label>
    <g:checkBox name="visibleOnFirstPage" value="${slideInstance.visibleOnFirstPage}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: slideInstance, field: 'image1024', 'error')} required">
    <label for="image1024">
        <g:message code="slide.image1024.label" default="image1024"/>
    </label>
    <input type="file" id="image1024" name="image1024" />
    <img src="<g:createLink controller="slide" action="getImage" params="${[id:slideInstance?.id, size:1024]}"/>" style="max-width: 100px"/>
</div>

<div class="fieldcontain ${hasErrors(bean: slideInstance, field: 'image1280', 'error')} required">
    <label for="image1280">
        <g:message code="slide.image1280.label" default="image1280"/>
    </label>
    <input type="file" id="image1280" name="image1280" />
    <img src="<g:createLink controller="slide" action="getImage" params="${[id:slideInstance?.id, size:1280]}"/>" style="max-width: 100px"/>
</div>

<div class="fieldcontain ${hasErrors(bean: slideInstance, field: 'image1440', 'error')} required">
    <label for="image1440">
        <g:message code="slide.image1440.label" default="image1440"/>
    </label>
    <input type="file" id="image1440" name="image1440" />
    <img src="<g:createLink controller="slide" action="getImage" params="${[id:slideInstance?.id, size:1440]}"/>" style="max-width: 100px"/>
</div>


