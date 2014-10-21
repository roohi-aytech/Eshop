<%@ page import="eshop.Customer" %>
<g:set var="department" value=""/>
<g:if test="${params.department == 'sales@zanbil.ir'}">
    <g:set var="department" value="فروش"/>
</g:if>
<g:if test="${params.department == 'order-tracking@zanbil.ir'}">
    <g:set var="department" value="پیگیری سفارشات "/>
</g:if>
<g:if test="${params.department == 'suppliers@zanbil.ir'}">
    <g:set var="department" value="تامین کنندگان و همکاران "/>
</g:if>
<g:if test="${params.department == 'web-support@zanbil.ir'}">
    <g:set var="department" value="پشتیبانی سایت "/>
</g:if>
<g:if test="${params.department == 'feedback@zanbil.ir'}">
    <g:set var="department" value="انتقادات و پیشنهادات"/>
</g:if>
${parameters.firstName} ${parameters.lastName}
<br/>
ایمیلی از طرف شما برای بخش
${department}
فروشگاه اینترنتی <g:message code="name"/> ارسال گردیده است. به شما اطمینان می دهیم که این ایمیل در حداقل زمان ممکن از طرف همکاران ما در بخش
${department}
بررسی و نتیجه آن برای شما ارسال خواهد گردید.
<br/>
با تشکر - فروشگاه اینترنتی <g:message code="name"/>