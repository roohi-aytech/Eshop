<%@ page contentType="text/html;charset=UTF-8" %>
${user.username}
<br/>
با سلام
<br/>
<br/>
برای تغییر رمز عبور خود بر روی لینک زیر کلیک کنید:
<br/>
<a href="${createLink(absolute: true, controller: 'customer', action: 'resetPassword', params: [id:user.id, code: "${new Date().timeString}_activate_${user.id}".encodeAsBase64()])}">
    تغییر رمز عبور
</a>