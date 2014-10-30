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
        <g:message code="help.payment"/>
    </title>
</head>

<body>
<div class="static-page-content">
    <h2>
        روشهای پرداخت
    </h2>

    <p>
        به منظور تامین رفاه هر چه بیشتر مشتریان، فروشگاه کلیه راهها و روشهای ممکن پرداخت را برای مشتریان فراهم نموده است:
    </p>
    <ol>
        <li>
            پرداخت آنلاین  (پرداخت از طریق درگاه بانکی)
        </li>
        <li>
            واریز به حساب بانکی
        </li>
        <li>
            کارت به کارت
        </li>
        <li>
            پرداخت در محل ویژه مشتریان ساکن شهر تهران (بصورت نقدی یا از طریق کارت بانکی)
        </li>
    </ol>
</div>
</body>
</html>