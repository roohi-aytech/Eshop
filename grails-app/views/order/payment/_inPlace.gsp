
<g:message code="payment.types.payInPlace.description"></g:message>
<g:form action="payInPlace">
    <g:hiddenField name="order.id" id="order" value="${params.id}"></g:hiddenField>
    <div class="toolbar" style="margin-top:10px;">
        <input type="submit" class="btn btn-primary"
               value="<g:message code="payment.types.payInPlace"></g:message>"/>
</g:form>
</div>