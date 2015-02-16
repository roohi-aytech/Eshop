فروشگاه اینترنتی <g:message code="name"/>
<br/>

${inviter}<br/>

${message}     <br/>

<a href="${createLink(uri: '/', absolute: true)}?invitation=${identifier}">
    <g:message code="name"/>
</a>

<a href="${createLink(controller: 'customer', action: 'register', absolute: true)}?invitation=${identifier}">
ثبت نام
</a>