<div id="no-sign-in">
<g:message code="payment.types.payInPlace.description"/>
<g:form action="payInPlace">
    <g:hiddenField name="order.id" id="order" value="${params.id}"/>
    <div class="toolbar" style="margin-top:10px;">
        <input type="submit" class="grn-btn full"
               value="<g:message code="payment.types.payInPlace"/>"/>
</g:form>
</div>
