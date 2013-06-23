<%--
  Created by IntelliJ IDEA.
  User: Farzin
  Date: 6/14/13
  Time: 2:52 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${article.name}</title>
    <meta charset="utf-8">
    <meta name="description" content="${article.summary}">
    <meta name="keywords" content="${article.keywords}">
</head>

<body>
<table class="layout-container table-simulated">
    <tr class="table-row">
        <td class="table-cell span180">
            <g:render template="productType/article_list"/>
            <div class="well sidebar-nav">
                <g:render template="common/browsingTextualMenu"></g:render>
            </div>
        </td>

        <td class="table-cell">
            <table class="table-simulated">
                <tr class="table-row">
                    <td class="table-cell" style="padding-left:5px;">
                        <ul class="breadcrumb">
                            <li>
                                <a href="${createLink(uri: '/')}"><g:message code="home"/></a>
                                <span class="divider">${">"}</span>
                            </li>
                            <g:if test="${breadCrumb.size() > 1}">
                                <g:each in="${breadCrumb[0..-1]}">
                                    <li>
                                        <a href="${it.href}">${it.name}</a>
                                        <span class="divider">${">"}</span>
                                    </li>
                                </g:each>
                            </g:if>
                            <li class="active">${article.name}</li>
                        </ul>
                    </td>
                </tr>

                <tr class="table-row">
                    <td class="table-cell">
                        <table class="table-simulated">
                            <tr class="table-row">
                                <td class="table-cell" id="product-description-area">

                                    <div class="white-panel">
                                        <h2>${article.name}</h2>

                                        <div class="article-summary">
                                            ${article.summary}
                                        </div>

                                        <div class="article-text">
                                            ${article.text}
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>