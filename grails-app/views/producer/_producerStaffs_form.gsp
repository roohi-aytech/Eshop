<%@ page import="eshop.StaffRole; eshop.Guarantee; eshop.ProducingProduct" %>
<g:hasErrors bean="${producerStaffInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${producerStaffInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${producerStaffInstance?.id}" />
<g:hiddenField name="version" value="${producerStaffInstance?.version}" />
<g:hiddenField name="producer.id" value="${producerId}"/>

<div>
    <div class="fieldcontain ${hasErrors(bean: producerStaffInstance, field: 'role', 'error')} ">
        <label for="roleId">
            <g:message code="producerStaff.role.label" default="Role"/>
        </label>
        <g:select id="roleId" name="role.id"
                  required=""
                  from="${eshop.StaffRole.list()}"
                  optionKey="id"
                  value="${producerStaffInstance?.role?.id}"
                  noSelection="['0': '']"/>

        <input type="button" value="${message(code: "add")}" onclick="addStaffRole()">
    </div>

    <div class="fieldcontain ${hasErrors(bean: producerStaffInstance, field: 'sex', 'error')} ">
        <label for="name">
            <g:message code="producerStaff.sex.label" default="Sex"/>

        </label>
        <g:select name="sex" from="${producerStaffInstance.constraints.sex.inList}" value="${producerStaffInstance?.sex}"
                  valueMessagePrefix="producerStaff.sex" noSelection="['': '']"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: producerStaffInstance, field: 'name', 'error')} ">
        <label for="name">
            <g:message code="producerStaff.name.label" default="Name"/>

        </label>
        <g:textField  name="name" value="${producerStaffInstance?.name}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: producerStaffInstance, field: 'lastName', 'error')} ">
        <label for="name">
            <g:message code="producerStaff.lastName.label" default="Name"/>

        </label>
        <g:textField  name="lastName" value="${producerStaffInstance?.lastName}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: producerStaffInstance, field: 'phoneNumber', 'error')} ">
        <label for="name">
            <g:message code="producerStaff.phoneNumber.label" default="phoneNumber"/>

        </label>
        <g:textField  name="phoneNumber"  value="${producerStaffInstance?.phoneNumber}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: producerStaffInstance, field: 'fax', 'error')} ">
        <label for="name">
            <g:message code="producerStaff.fax.label" default="Fax"/>

        </label>
        <g:textField  name="fax" value="${producerStaffInstance?.fax}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: producerStaffInstance, field: 'mobile', 'error')} ">
        <label for="name">
            <g:message code="producerStaff.mobile.label" default="Mobile"/>

        </label>
        <g:textField  name="mobile"  value="${producerStaffInstance?.mobile}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: producerStaffInstance, field: 'emailAddress', 'error')} ">
        <label for="name">
            <g:message code="producerStaff.emailAddress.label" default="Email Address"/>

        </label>
        <g:textField  name="emailAddress"  value="${producerStaffInstance?.emailAddress}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: producerStaffInstance, field: 'secretary', 'error')} ">
        <label for="name">
            <g:message code="producerStaff.secretary.label" default="Secretary"/>

        </label>
        <g:textField  name="secretary"  value="${producerStaffInstance?.secretary}"/>
    </div>

</div>


<script type="text/javascript">
    function addStaffRole(){
        loadOverlay('<g:createLink controller="staffRole" action="form"/>',
                '<g:createLink controller="staffRole" action="save"/>',
                function(r){
                    $("#staffRole").val(r.role)
                    $("#staffRole.id").val(r.id)
                })
    }
</script>





