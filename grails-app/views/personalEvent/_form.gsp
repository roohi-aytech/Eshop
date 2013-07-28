%{--easy ui--}%

<style>
.combo {
    background-color: #FFFFFF;
    border: 1px solid #CCCCCC;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
    transition: border 0.2s linear 0s, box-shadow 0.2s linear 0s;
    border-radius: 3px;
    padding: 5px;
    height: 17px !important;
}

.combo .combo-text {
    box-shadow: none;
}

.combo .combo-text:focus {
    box-shadow: none;
}

.hasDatepicker {
    width: 160px;
}
</style>

<script language="javascript" type="text/javascript">
    function setSex() {
        var url = "<g:createLink controller="relationship" action="getSex"/>/" + $('#relationship').val();
        $.ajax({
            type: "get",
            url: url
        }).done(function (response) {
                    $('#sex').val(response);
                });
    }
</script>

<g:hasErrors bean="${personalEventInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${personalEventInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                    error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${personalEventInstance?.id}"/>
<g:hiddenField name="version" value="${personalEventInstance?.version}"/>

<table style="margin-top: 10px;">
    <tr class="fieldcontain ${hasErrors(bean: personalEventInstance, field: 'title', 'error')} ">
        <td style="width: 100px">
            <label for="title">
                <g:message code="personalEvent.title.label" default="Title"/>

            </label>
        </td>
        <td>
            <g:textField name="title" value="${personalEventInstance?.title}" style="width:450px"/>
        </td>
    </tr>

    <tr class="fieldcontain ${hasErrors(bean: personalEventInstance, field: 'fullName', 'error')} ">
        <td>
            <label for="fullName">
                <g:message code="personalEvent.fullName.label" default="Full Name"/>

            </label>
        </td>
        <td>
            <g:textField name="fullName" value="${personalEventInstance?.fullName}" style="width:300px"/>
        </td>
    </tr>

    <tr class="fieldcontain ${hasErrors(bean: personalEventInstance, field: 'relationship', 'error')} required">
        <td>
            <label for="relationship">
                <g:message code="personalEvent.relationship.label" default="Relationship"/>
                <span class="required-indicator">*</span>
            </label>
        </td>
        <td>
            <g:select id="relationship" name="relationship.id" from="${eshop.Relationship.list()}" optionKey="id"
                      required="" onchange="setSex();" value="${personalEventInstance?.relationship?.id}"
                      class="many-to-one" style="width:200px"/>
            <g:if test="${!params.id}">
                <script language="javascript" type="text/javascript">
                    setSex();
                </script>
            </g:if>
        </td>
    </tr>

    <tr class="fieldcontain ${hasErrors(bean: personalEventInstance, field: 'sex', 'error')} ">
        <td>
            <label for="sex">
                <g:message code="personalEvent.sex.label" default="Sex"/>

            </label>
        </td>
        <td>
            <g:select id="sex" name="sex" from="${personalEventInstance.constraints.sex.inList}"
                      value="${personalEventInstance?.sex}" valueMessagePrefix="personalEvent.sex"
                      noSelection="['': '']" style="width:60px"/>
        </td>
    </tr>

    <tr class="fieldcontain ${hasErrors(bean: personalEventInstance, field: 'date', 'error')} required">
        <td>
            <label for="date">
                <g:message code="personalEvent.date.label" default="Date"/>
                <span class="required-indicator">*</span>
            </label>
        </td>
        <td>
            %{--<g:datePicker name="date" precision="day" value="${personalEventInstance?.date}"/>--}%
            <rg:datePicker name="date" value="${personalEventInstance?.date}" style="width:120px"/>
        </td>
    </tr>

    <tr class="fieldcontain ${hasErrors(bean: personalEventInstance, field: 'jobTitle', 'error')} ">
        <td>
            <label for="jobTitle">
                <g:message code="personalEvent.jobTitle.label" default="Job Title"/>

            </label>
        </td>
        <td>
            <g:select name="jobTitle" from="${personalEventInstance.constraints.jobTitle.inList}"
                      value="${personalEventInstance?.jobTitle}" valueMessagePrefix="personalEvent.jobTitle"
                      noSelection="['': '']" style="width:130px"/>
        </td>
    </tr>

    <tr class="fieldcontain ${hasErrors(bean: personalEventInstance, field: 'favoriteStyle', 'error')} ">
        <td>
            <label for="favoriteStyle">
                <g:message code="personalEvent.favoriteStyle.label" default="Favorite Style"/>

            </label>
        </td>
        <td>
            <g:select name="favoriteStyle" from="${personalEventInstance.constraints.favoriteStyle.inList}"
                      value="${personalEventInstance?.favoriteStyle}" valueMessagePrefix="personalEvent.favoriteStyle"
                      noSelection="['': '']" style="width:80px"/>
        </td>
    </tr>

    <tr class="fieldcontain ${hasErrors(bean: personalEventInstance, field: 'minPrice', 'error')} ">
        <td>
            <label for="minPrice">
                <g:message code="personalEvent.minPrice.label" default="Min Price"/>

            </label>
        </td>
        <td>
            <g:field type="number" name="minPrice" value="${personalEventInstance.minPrice}" style="width:100px"/>
        </td>
    </tr>

    <tr class="fieldcontain ${hasErrors(bean: personalEventInstance, field: 'maxPrice', 'error')} ">
        <td>
            <label for="maxPrice">
                <g:message code="personalEvent.maxPrice.label" default="Max Price"/>

            </label>
        </td>
        <td>
            <g:field type="number" name="maxPrice" value="${personalEventInstance.maxPrice}" style="width:100px"/>
        </td>
    </tr>

    <tr class="fieldcontain ${hasErrors(bean: personalEventInstance, field: 'favoriteProductTypes', 'error')} ">
        <td>
            <label for="favoriteProductTypes">
                <g:message code="personalEvent.favoriteProductTypes.label" default="Favorite Product Types"/>

            </label>
        </td>
        <td>
            <rg:tree bean="${personalEventInstance}" name="favoriteProductTypes" field="favoriteProductTypes"
                     relationField="parentProduct" width="520px"
                     cascadeCheck="true"></rg:tree>
        </td>
    </tr>
</table>

