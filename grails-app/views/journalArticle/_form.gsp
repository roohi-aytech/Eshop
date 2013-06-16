<%@ page import="eshop.JournalArticle" %>

<g:hasErrors bean="${journalArticleInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${journalArticleInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                    error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${journalArticleInstance?.id}"/>
<g:hiddenField name="version" value="${journalArticleInstance?.version}"/>
<g:hiddenField name="baseProduct.id" value="${journalArticleInstance?.baseProduct?.id}"/>


<div class="fieldcontain ${hasErrors(bean: journalArticleInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="journalArticle.name.label" default="Name"/>

    </label>
    <g:textField name="name" value="${journalArticleInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: journalArticleInstance, field: 'summary', 'error')} ">
    <label for="summary">
        <g:message code="journalArticle.summary.label" default="Summary"/>

    </label>
    <g:textArea name="summary" value="${journalArticleInstance?.summary}" style="width: 400px"/>
</div>

<div class="fieldcontain ${hasErrors(bean: journalArticleInstance, field: 'keywords', 'error')} ">
    <label for="summary">
        <g:message code="journalArticle.keywords.label" default="keywords"/>

    </label>
    <g:textArea name="keywords" value="${journalArticleInstance?.keywords}" style="width: 400px"/>
</div>

<div class="fieldcontain ${hasErrors(bean: journalArticleInstance, field: 'text', 'error')} ">
    <label for="text">
        <g:message code="journalArticle.text.label" default="Text"/>

    </label>

    <ckeditor:editor name="text" width="99%" height="200px">
        ${journalArticleInstance?.text}
    </ckeditor:editor>
</div>


