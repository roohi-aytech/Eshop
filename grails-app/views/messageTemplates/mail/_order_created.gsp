${order.ownerName} <br/>

درخواست شما در سیستم <g:link uri="/" absolute="true">فروشگاه اینترنتی <g:message code="name"/></g:link> ثبت گردید. به شما اطمینان می دهیم که این درخواست به سرعت توسط همکاران ما بررسی و به محض نهایی شدن از طریق ایمیل و پیامک به شما اطلاع رسانی می گردد.
<g:if test="${!grailsApplication.config.payOnCheckout}">
پس از دریافت پاسخ استعلام، شما فرصت خواهید داشت تا در مهلت مشخص شده و  از طریق ورود به حساب کاربری خود، نسبت به نهایی نمودن سفارش اقدام نمایید.
</g:if>


<br/>
<g:message code="order.trackingCode.label"/>: <g:link controller="order" action="track" params="[trackingCode:order.trackingCode]" absolute="true">${order.trackingCode}</g:link>