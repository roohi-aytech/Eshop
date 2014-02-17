<div><g:message code="alerts.basket.newItem" args="${[name]}"/></div>
<br/>
<div>
    <g:link class="btn" controller="basket" action="checkout"><g:message code="alerts.basket.button.checkOut"/></g:link>
    <span class="btn" onclick="$('#link-basket').qtip('hide');"><g:message code="alerts.basket.buttons.cancel"/></span>
</div>