<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 10/18/14
  Time: 6:32 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="mobile">
    <title><g:message code="site.mainPage.title"/></title>
    <meta name="description" content="${message(code: 'site.mainPage.description')}">
    <meta name="keywords" content="${message(code: 'site.mainPage.keywords')}">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
<g:render template="/mobile/common/slideshowMain"/>
<g:render template="/mobile/common/banners"/>
<g:render template="/mobile/common/rootProductTypes"/>
<g:render template="/mobile/common/slideshowSpecialSales"/>
<script language="javascript" type="text/javascript" src="${resource(dir:'js/mobile/custom', file: 'index.js')}"></script>

</body>
</html>