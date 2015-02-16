<%--
  Created by IntelliJ IDEA.
  User: farzin
  Date: 7/22/13
  Time: 6:50 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <g:if test="${session.mobile}">
        <meta name='layout' content='mobile'/>
    </g:if>
    <title>
        <g:message code="help.supplier"/>
    </title>
</head>

<body>
<div class="static-page-content">
    <h2>
        عرضه محصولات در زنبیل
    </h2>
    <p>
        تامین کنندگان (تولیدکنندگان و وارد کنندگان) محترمی که راساً و بدون واسطه نسبت به عرضه کالا در حیطه کالاهای عرضه شده در سایت فعال هستند، در صورتی که حائز شرایط لازم گردند، می توانند در غالب تامین کننده جدید با فروشگاه همکاری نمایند.
    </p>
    <p>
        بدین منظور لازم است تامین کنندگان محترم درخواست همکاری به همراه لیست محصولات و عکس آنها و سابقه فعالیت خود در صنف مورد نظر را از طریق ایمیل <b>suppliers [at] zanbil [dot] ir</b>  برای فروشگاه ارسال نمایند تا در اسرع وقت بررسی و نتیجه آن به ایشان اعلام گردد.
    </p>
</div>
</body>
</html>