<%@ page import="eshop.StaffRole; eshop.Guarantee; eshop.ProducingProduct" %>
<g:hasErrors bean="${producerAccountInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${producerAccountInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:hiddenField name="id" value="${producerAccountInstance?.id}" />
<g:hiddenField name="version" value="${producerAccountInstance?.version}" />
<g:hiddenField name="producer.id" value="${producerId}"/>

<div>
    <div class="fieldcontain ${hasErrors(bean: producerAccountInstance, field: 'bank', 'error')} ">
        <label for="bank">
            <g:message code="producerAccount.bank.label" default="Bank"/>

        </label>
        <g:textField  name="bank" value="${producerAccountInstance?.bank}"/>

    </div>

    <div class="fieldcontain ${hasErrors(bean: producerAccountInstance, field: 'branch', 'error')} ">
        <label for="branch">
            <g:message code="producerAccount.branch.label" default="Branch"/>

        </label>
        <g:textField  name="branch" value="${producerAccountInstance?.branch}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: producerAccountInstance, field: 'branchCode', 'error')} ">
        <label for="branchCode">
            <g:message code="producerAccount.branchCode.label" default="Branch Code"/>

        </label>
        <g:textField  name="branchCode" value="${producerAccountInstance?.branchCode}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: producerAccountInstance, field: 'accountNo', 'error')} ">
        <label for="accountNo">
            <g:message code="producerAccount.accountNo.label" default="AccountNo"/>

        </label>
        <g:textField  name="accountNo"  value="${producerAccountInstance?.accountNo}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: producerAccountInstance, field: 'shebaNo', 'error')} ">
        <label for="shebaNo">
            <g:message code="producerAccount.shebaNo.label" default="ShebaNo"/>

        </label>
        <g:textField  name="shebaNo" value="${producerAccountInstance?.shebaNo}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: producerAccountInstance, field: 'cardNo', 'error')} ">
        <label for="cardNo">
            <g:message code="producerAccount.cardNo.label" default="cardNo"/>

        </label>
        <g:textField  name="cardNo"  value="${producerAccountInstance?.cardNo}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: producerAccountInstance, field: 'name', 'error')} ">
        <label for="name">
            <g:message code="producerAccount.name.label" default="name"/>

        </label>
        <g:textField  name="name"  value="${producerAccountInstance?.name}"/>
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





