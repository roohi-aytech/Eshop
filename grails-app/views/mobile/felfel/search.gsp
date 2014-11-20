<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html dir="rtl">
<head>
    <meta name='layout' content='mobile'/>
    <g:if test="${title}">
        <title>${title}</title>
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

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <script language="JavaScript" type="text/javascript"
            src="${resource(dir: 'js', file: 'jquery.transform.js')}"></script>
</head>

<body>

<div class="p_heading m_bottom10">
    <h2>

        ${title}
    </h2>
</div>

<div class="sort-bar">
    <div class="right">
        <g:render template="/mobile/common/sortFilter"/>
    </div>

    <div class="left filter-link bbq" data-q="filters" id="div-filters">
        <a href="javascript://"><h4><g:message code="filter"/><span><img
                src="${resource(dir: 'images/mobile', file: 'filter-left-icon.png')}"></span></h4></a>
    </div>

    <div class="clearfix"></div>
</div>

<div class="clear"></div>

<div class="filter-products">
    <g:render template="/mobile/common/productGrid" model="${[productIds: filters.products.productIds]}"/>
</div>
<div class="clear"></div>
<g:render template="/mobile/common/pagination" model="${totalPages = filters.products.totalPages}"/>

<g:render template="/mobile/common/filterFilter"/>


<script language="javascript" type="text/javascript"
        src="${resource(dir: 'js/mobile/custom', file: 'browse.js')}"></script>

<script language="javascript" type="text/javascript"
        src="${resource(dir: 'js/mobile', file: 'jquery.fastLiveFilter.js')}"></script>
<script language="javascript" type="text/javascript"
        src="${resource(dir: 'js/mobile', file: 'clip.js')}"></script>
</body>
</html>