<div class="share-icons">
    <ul>
        <li class="share-this">
            <p>${message(code: 'share')}</p>

            <div class="sare-this-arrow">
                <img width="113" height="134" src="${resource(dir: 'images/mobile', file: 'share_this_arrow.png')}">
            </div>
        </li>
        <li class="fb">
            <a target="_blank"
               href="http://www.facebook.com/sharer/sharer.php?u=${createLink(uri: "/product/${productModel?.product?.id}?model=${productModel?.id}", absolute: true)}"><img
                    width="57" border="0" src="${resource(dir:'images/mobile', file: 'fb.png')}"></a>
        </li>
        <li class="twt">
            <a target="_blank"
               href="http://twitter.com/home?status=${productModel} ${createLink(uri: "/product/${productModel?.product?.id}?model=${productModel?.id}", absolute: true)} @felfel.ir"><img
                    width="55" border="0" src="${resource(dir:'images/mobile', file: 'twt.png')}"></a></li>
        <li class="pin">
            <!-- Place this tag in your head or just before your close body tag. -->
            <script src="https://apis.google.com/js/platform.js" async defer>
                {lang: 'fa'}
            </script>

            <!-- Place this tag where you want the +1 button to render. -->
            <div class="g-plusone" data-size="tall" data-annotation="none"></div>
        </li>
    </ul>
</div>