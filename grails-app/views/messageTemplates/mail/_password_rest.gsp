<%@ page import="eshop.Customer" %>

<g:if test="${user instanceof Customer}">
    <g:message code="customer.title.${((Customer)user).sex}"/> ${((Customer)user).lastName}
</g:if>
<g:else>
    ${user.username}
</g:else>
<br/>
درخواستی مبنی بر "فراموشی کلمه عبور" از جانب شما برای ما ارسال گردیده است. چنانچه این درخواست از طرف شما بوده، با کلیک بر روی لینک زیر و انجام مراحل آن، نسبت به تغییر رمز خود اقدام فرمایید. اما چنانچه این درخواست از طرف شما نبوده، لطفا بدون انجام هیچ اقدامی از صفحه خارج شوید.
<br/>
<a href="${createLink(absolute: true, controller: 'customer', action: 'resetPassword', params: [id: user.id, code: "${new Date().timeString}_activate_${user.id}".encodeAsBase64()])}">
    تغییر رمز عبور
</a>