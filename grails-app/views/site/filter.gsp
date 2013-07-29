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

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'site.css')}"/>
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
                <g:render template="common/filteringTextualMenu"></g:render>
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
                                        <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
                                            <a href="${createLink(uri: '/')}" itemprop="url">
                                                <span itemprop="title">
                                                    <g:message code="home"/>
                                                </span>
                                            </a>
                                            %{--<span class="divider">${">"}</span>--}%
                                        </li>
                                        <g:if test="${filters.breadcrumb.size() > 0}">
                                            <g:each in="${filters.breadcrumb[0..-1]}">
                                                <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
                                                    <span class="divider">${">"}</span>
                                                    <a href="${commonLink}${it.linkTail}"
                                                       itemprop="url"><span itemprop="title">${it.linkTitle}</span></a>
                                                </li>
                                            </g:each>
                                        </g:if>
                                    %{--<li class="active">${filters.breadcrumb[-1].linkTitle}</li>--}%
                                    </ul>

                                    <g:render template="common/filteringGraphicalMenu"></g:render>


                                    %{--<g:if test="${filters.productTypes?.isEmpty()}">--}%
                                    <g:render template="common/productGrid"
                                              model="${[productIds: filters.products.productIds]}"></g:render>
                                    %{--</g:if>--}%

                                </td>

                                <td class="span200 table-cell">
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