
<g:message code="customer.title.${customer.sex}"/> ${customer.lastName}
<br/>
از ثبت نام شما در فروشگاه اینترنتی <g:message code="name"/> سپاسگزاریم. حساب کاربری شما ایجاد گردیده اما لازمست قبل از ورود به سایت، حساب کاربری خود را از طریق کلیک بر روی لینک زیر فعال نمایید.
<br/>
<a href="${createLink(absolute: true, controller: 'customer', action: 'activate', params: [id:customer.id, code: "${new Date().timeString}_activate_${customer.id}".encodeAsBase64()])}">
    فعال سازی حساب کاربری
</a>
<br/>
<g:if test="${bonDiscount}">
همچنین مبلغ <g:formatNumber number="${bonDiscount}" type="number"/> ریال گلبن به حساب کاربری شما اضافه شد
    <br/>
</g:if>
در صورتیکه این درخواست عضویت از جانب شما نبوده، لطفا بدون انجام هیچ اقدامی از صفحه خارج شوید.