<%@ page import="eshop.NewsLetter" %>
<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery-ui-timepicker-addon.css')}" type="text/css">
<style>

.checkBoxList {
    padding: 5px;
    border: 1px solid #eeeeee;
    border-radius: 5px;
    height: 100px;
    width: 690px;
    overflow: auto;
    display: block !important;
}

.checkBoxList div {
    display: block !important;
}

.checkBoxList label {
    width: auto;
    display: inline-block;
    font-size: 11px;
}

td {
    text-align: right;
}

.jstree-default-rtl.jstree-focused {
    background: none;
}

.fieldcontain div {
    display: inline;
}

#sendDateContainer input{
    width: 148px;
    text-align: center !important;
}
</style>

<g:javascript src="jquery-ui-sliderAccess.js"/>
<g:javascript src="jquery-ui-timepicker-addon.js"/>

<g:hasErrors bean="${newsLetterInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${newsLetterInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                    error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${newsLetterInstance?.id}"/>
<g:hiddenField name="version" value="${newsLetterInstance?.version}"/>


<div class="fieldcontain ${hasErrors(bean: newsLetterInstance, field: 'subject', 'error')} ">
    <label for="subject">
        <g:message code="newsLetter.subject.label" default="Subject"/>

    </label>
    <g:textField name="subject" value="${newsLetterInstance?.subject}" class="count-words" size="112"/>
</div>


<div class="fieldcontain ${hasErrors(bean: newsLetterInstance, field: 'productTypes', 'error')} ">
    <label for="productTypes">
        <g:message code="newsLetter.productTypes.label" default="Product Types"/>

    </label>

    <rg:tree bean="${newsLetterInstance}" field="productTypes" relationField="parentProduct" width="700px"
             cascadeCheck="true"></rg:tree>
</div>

<div class="fieldcontain ${hasErrors(bean: newsLetterInstance, field: 'categories', 'error')} ">
    <label for="categories">
        <g:message code="newsLetter.categories.label" default="Categories"/>

    </label>

    <div class="checkBoxList">
        <g:each in="${newsLetterInstance?.categories?.sort { it.name }}" var="category">
            <div>
                <g:checkBox name="categories" id="category${category.id}" value="${category.id}"
                            checked="${newsLetterInstance?.categories?.contains(category)}"
                            title="${category.name}"/>
                <label for="category${category.id}">
                    ${category.name}
                </label>
            </div>
        </g:each>
        <g:each in="${eshop.NewsLetterCategory.list().findAll { !it.deleted && !newsLetterInstance?.categories?.contains(it) }.sort { it.name }}"
                var="category">
            <div>
                <g:checkBox name="categories" id="category${category.id}" value="${category.id}"
                            checked="${newsLetterInstance?.categories?.contains(category)}"
                            title="${category.name}"/>
                <label for="category${category.id}">
                    ${category.name}
                </label>
            </div>
        </g:each>
    </div>
</div>

<div id="sendDateContainer" class="fieldcontain ${hasErrors(bean: newsLetterInstance, field: 'sendDate', 'error')} ">
    <g:message code="newsLetter.sendDate.label" default="Send Date"/>

    <rg:datePicker name="sendDate" value="${newsLetterInstance.sendDate}"/>
    <g:message code="newsLetter.sendTime.label" default="Send Date"/>

    <input type="text" id="sendTime" name="sendTime" value="${newsLetterInstance.sendDate? "${newsLetterInstance.sendDate.hours}:${newsLetterInstance.sendDate.minutes}" :''}"/>
    <script>
        $('#sendTime').timepicker();
    </script>
</div>

<div class="fieldcontain ${hasErrors(bean: newsLetterInstance, field: 'sendDate', 'error')} ">
</div>

<script>
    try {
        CKEDITOR.remove(CKEDITOR.instances['body_editor'])
    } catch (ex) {
    }
</script>

<div class="fieldcontain ${hasErrors(bean: newsLetterInstance, field: 'body', 'error')} ">
    <label for="body">
        <g:message code="newsLetter.body.label" default="Body"/>

    </label>
    <g:hiddenField name="body" />
    <ckeditor:editor name="body_editor" width="99%" height="200px">
        ${newsLetterInstance?.body}
    </ckeditor:editor>
</div>

