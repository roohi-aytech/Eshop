${order.ownerName} <br/>

درخواست شما توسط همکاران ما بررسی گردید و اکنون شما قادر هستید بر اساس پیش فاکتور ارسالی، سفارش خود را حداکثر تا

<rg:formatJalaliDate hm="true" date="${order.paymentTimeout}"/>

تکمیل فرمایید.


<br/>
<a href="${createLink(controller: 'order', action: 'completion', params: [id: order.id], absolute: true)}">
    نهایی کردن سفارش
</a>