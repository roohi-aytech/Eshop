
<script language="javascript" type="text/javascript">

    function addToBasket(id, name, price, selectedAddedValues, count, type, productId, animate){
        angular.element(document.body).scope().addToBasket(id, name, price, selectedAddedValues, count, type, productId, animate);
    }
</script>

<div id="vip-cart-div" class="light-grn-btn">
    <eshop:addToBasket prodcutModelId="${productModel?.id}" buttonOnly="${true}" animate="true" class="light-grn-submit" useLongText="true" angular="false"/>
</div>
<g:if test="${grailsApplication.config.eShop.instance!='goldaan'}">
    <div class="acnt-btn no-arrow">
        <div id="wishlist-div">
            <a id="wishlist" href="javascript:addToWishList()">
                <span class="heart-icon">
                    <img width="20" src="${resource(dir: 'images/mobile', file: 'heart.png')}" id="wish_heartimg"/>
                </span>

                <h3 id="wish_text">${message(code: 'add-to-wishList.long')}</h3>
            </a>
        </div>
    </div>
    <script language="javascript" type="text/javascript">
        function addToWishList() {
            $('#wish_text').text('${message(code:'waiting')}');
            $.ajax({
                type: "POST",
                url: "${createLink(controller: 'wishList', action: 'add', id: product?.id)}"
            }).done(function (response) {
                if (response == "1") {
                    $('#wish_heartimg').attr('src', '${resource(dir:'images/mobile', file: 'heart_red.png', absolute: true)}');
                    $('#wish_text').text('${message(code:'wishList.added')}');
                }
                else {
                    window.location.href = "${createLink(controller: 'login', action: 'auth')}";
                }
            });
        }
    </script>
</g:if>