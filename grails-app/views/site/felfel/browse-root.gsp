<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html dir="rtl">
<head>
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

    <script language="JavaScript" type="text/javascript" src="${resource(dir:'js', file: 'jquery.transform.js')}"></script>
</head>

<body>

<ul class="breadcrumb">
    <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
        <a href="${createLink(uri: '/')}" itemprop="url" class="home">
            <span itemprop="title">
                <g:message code="home"/>
            </span>
        </a>
    </li>
    <g:if test="${breadCrumb.size() > 0}">
        <g:each in="${breadCrumb[0..-1]}">
            <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
                <span class="divider">${"/"}</span>
                <a href="${it.href}" itemprop="url">
                    <span itemprop="title">${it.name}</span></a>
            </li>
        </g:each>
    </g:if>
</ul>
<div class="clearfix"></div>
<g:render template="common/browsingMixedMenu"/>

<eshop:selectedProductsList productTypeId="${productType.id}"/>

<g:if test="${filters?.brands}">
    <g:render template="common/brandList" model="${[brands: filters.brands?.size() > 10 ? filters.brands[0..10] : filters.brands ]}"/>
</g:if>

</body>
</html>