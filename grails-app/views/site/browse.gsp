<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html dir="rtl">
<head>
    <g:if test="${title}">
        <title><g:message code="site.title"/>: ${title}</title>
    </g:if>
    <meta charset="utf-8">
    <g:if test="${description}">
        <meta name="description" content="${description}">
    </g:if>
    <g:if test="${keywords}">
        <meta name="keywords" content="${keywords}">
    </g:if>

    <g:render template="common/productGridMeta"
              model="${[productIds: filters.products.productIds]}"/>
    <style>
    body {
        padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
    }
    </style>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>

<body>
<table class="layout-container table-simulated">
    <tr class="table-row">
        <td class="span180 table-cell">
            <div class="well sidebar-nav">
                <g:render template="common/browsingTextualMenu"></g:render>
            </div>
            <g:render template="productType/article_list"/>
            <g:render template="banners/rightsideBanners"/>
        </td>

        <td class="table-cell">
            <table class="table-simulated">
                <tr class="table-row">
                    <td>
                        <g:render template="common/slideshowMain"></g:render>
                    </td>
                </tr>

                <tr class="table-row">
                    <td class="table-cell">
                        <table class="table-simulated">
                            <tr class="table-row">
                                <td class="span600 table-cell">
                                    <ul class="breadcrumb">
                                        <li>
                                            <a href="${createLink(uri: '/')}"><g:message code="home"/></a>
                                            <span class="divider">${">"}</span>
                                        </li>
                                        <g:if test="${breadCrumb.size() > 1}">
                                            <g:each in="${breadCrumb[0..-2]}">
                                                <li>
                                                    <a href="${it.href}">${it.name}</a>
                                                    <span class="divider">${">"}</span>
                                                </li>
                                            </g:each>
                                        </g:if>
                                        <li class="active">${breadCrumb[-1].name}</li>
                                    </ul>

                                    <g:render template="common/browsingGraphicalMenu"></g:render>

                                    %{--<g:if test="${subProductTypeLinks?.isEmpty()}">--}%
                                    <g:render template="common/productGrid"
                                              model="${[productIds: filters.products.productIds]}"></g:render>
                                    %{--</g:if>--}%

                                </td>

                                <td class="span200 table-cell">
                                    <g:render template="banners/enamad"></g:render>
                                    <g:render template="banners/leftsideBanners"></g:render>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<script type="text/javascript">
    (function ($) {
        $('.row-fluid ul.thumbnails li.span6:nth-child(2n + 3)').css('margin-right', '0px');
        $('.row-fluid ul.thumbnails li.span4:nth-child(3n + 4)').css('margin-right', '0px');
        $('.row-fluid ul.thumbnails li.span3:nth-child(4n + 5)').css('margin-right', '0px');
    })(jQuery);
</script>
</body>
</html>