<div><g:message code="alerts.basket.newItem" args="${[name]}"/></div>
<br/>
<div>
    <span class="btn continueshoppingbtn" onclick="$('#link-basket').qtip('hide');"><g:message code="alerts.basket.buttons.cancel"/></span>
    <g:link class="btn checkoutbtn" controller="basket" action="checkout"><g:message code="alerts.basket.button.checkOut"/></g:link>
</div>