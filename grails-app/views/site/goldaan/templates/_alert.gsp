<div><g:message code="alerts.basket.newItem" args="${[name]}"/></div>
<br/>
<div>
    <span class="btn continueshoppingbtn" onclick="$('#link-basket').qtip('hide');"><g:message code="alerts.basket.buttons.cancel"/></span>
    <sec:ifLoggedIn>
        <common:link class="btn-shop" controller="basket" action="checkout" https="${false}">
            <g:link class="btn checkoutbtn" controller="basket" action="checkout"><g:message code="alerts.basket.button.checkOut"/></g:link>
        </common:link>
    </sec:ifLoggedIn>
    <sec:ifNotLoggedIn>
        <button class="btn checkoutbtn" onclick="showLoginRegisterDialog()">
            <g:message code="alerts.basket.button.checkOut"/>
        </button>
    </sec:ifNotLoggedIn>

</div>