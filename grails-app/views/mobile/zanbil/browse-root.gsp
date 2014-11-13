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
    <h2><g:message code="menu.header.mobileTitle"
                   args="[productType.name, createLink(uri: '/browse/' + productType.seoFriendlyName)]"/></h2>
</div>

<g:if test="${productType?.menuImage?.size() > 0}">
    <div class="listing-banner">
        <p>
            <img width="1200" height="" alt=""
                 src="${createLink(controller: 'image', params: [id: productType.id, type: 'productTypeMenu'])}"/>
        </p>
    </div>
</g:if>
<g:render template="/mobile/common/brandList"/>
<div id="tag_top_overriden" class="clearfix" style="margin-top: -208px;">
    <a class="more_options_block" href="#">
        <span class="more_down_arr">&nbsp;</span>
        <span class="more_block_text" id="more_block_text"><g:message code="more"/></span>
        <span class="more_down_arr">&nbsp;</span>
    </a>
    <eshop:selectedProductsList productTypeId="${productType.id}"/>
</div>

<div class="clear20"></div>
<g:render template="/mobile/common/productTypeList"/>


<script language="javascript" type="text/javascript" src="${resource(dir:'js/mobile/custom', file: 'browse.js')}"></script>
</body>
</html>