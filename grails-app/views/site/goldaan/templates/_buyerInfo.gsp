<div class="shopping-basket">
    <div class="alert alert-warning">
        <g:message code="buyer-info-message"/>
        <br/>
        <br/>
        <g:link class="btn btn-primary" action="auth" controller="login"><g:message code="login.link" /></g:link>
        <g:link class="btn btn-success" action="register" controller="customer"><g:message code="register.link" /></g:link>
    </div>
    <div class="buyer-info-items">
        <input id="buyerPhone" type="text" ng-model="buyerPhone" placeholder="<g:message code="buyer-phone" />">
        <input id="buyerEmail" type="text" ng-model="buyerEmail" placeholder="<g:message code="buyer-email" />">
    </div>
    <div class="basket-actions">
        <button class="btn btn-primary" onclick="deliveryReview()"><g:message code="prev-step" /></button>
        <button class="btn btn-success" onclick="if(updateBuyerInfo()){finalizeBasket(this)}"><g:message code="alerts.basket.button.checkOut" /></button>
    </div>
</div>