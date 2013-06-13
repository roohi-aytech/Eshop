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

    <!-- Le fav and touch icons -->
    %{--<link rel="shortcut icon" href="../assets/ico/favicon.ico">--}%
    %{--<link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">--}%
    %{--<link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">--}%
    %{--<link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">--}%
    %{--<link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">--}%

</head>

<body>

<div class="layout-container table">
    <div class="table-row">

        <g:if test="${filters.products.productIds.isEmpty()}">
        </g:if>
        <g:else>
            <div class="span180 table-cell">
                <div class="well sidebar-nav">
                    <g:render template="common/filteringTextualMenu"></g:render>
                </div>
            </div>
        </g:else>

        <div class="table-cell" ${filters.products.productIds.isEmpty()? "style='padding-right:5px;'":""}>
            <div class="table">
                <div class="table-row">
                    <g:render template="common/slideshowMain"></g:render>
                </div>

                <div class="table-row">
                    <div class="table-cell">
                        <div class="table">
                            <div class="table-row">
                                <div class="span600 table-cell">
                                    <ul class="breadcrumb">
                                        <li class="active">
                                            <g:message code="search"/>
                                            <span class="divider">${">"}</span>
                                        </li>
                                        <g:if test="${filters.breadcrumb.size() > 0}">
                                            <g:each in="${filters.breadcrumb[0..-1]}">
                                                <li>
                                                    <a href="${commonLink}${it.linkTail}">${it.linkTitle}</a>
                                                    <span class="divider">${">"}</span>
                                                </li>
                                            </g:each>
                                        </g:if>
                                        <li class="active">${params.phrase}</li>
                                    </ul>

                                    <g:if test="${filters.products.productIds.isEmpty()}">
                                        <g:message code="search.nothingMatchedYourQuery"/>
                                    </g:if>
                                    <g:else>
                                        <g:render template="common/filteringGraphicalMenu"></g:render>
                                        <g:render template="common/productGrid"
                                                  model="${[productIds: filters.products.productIds]}"></g:render>
                                    </g:else>
                                </div>

                                <div class="span200 table-cell">
                                    <g:render template="banners/enamad"></g:render>
                                    <g:render template="banners/leftsideBanners"></g:render>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    (function ($) {
        $('.row-fluid ul.thumbnails li.span6:nth-child(2n + 3)').css('margin-right', '0px');
        $('.row-fluid ul.thumbnails li.span4:nth-child(3n + 4)').css('margin-right', '0px');
        $('.row-fluid ul.thumbnails li.span3:nth-child(4n + 5)').css('margin-right', '0px');
    })(jQuery);
</script>
</body>
</html>