<%@ page import="eshop.ProductModel" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html dir="rtl">
<head>
    <meta name='layout' content='mobile'/>
    <title>${product.manualTitle ? product.pageTitle : title}</title>
    <meta charset="utf-8">
    <meta name="description" content="${description}">
    <meta name="keywords" content="">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <script language="javascript" src="${resource(dir: 'js', file: 'browse.js')}" type="text/javascript"></script>
</head>

<body>
<div style="display: none" class="item_added_vip" id="cart_msg">
    <span class="added_to_cart_above_320"><g:message code="basket.itemAdded"/></span>
    %{--<span class="added_to_cart_below_320">Added!</span>--}%
    <a class="grn-btn icon-lock left" href="${createLink(controller: 'basket', action: 'checkout')}"><h3><g:message
            code="alerts.basket.button.checkOut"/></h3></a>

    <div class="clearfix"></div>
</div>

<div id="product-price">
    <g:render template="/mobile/common/product/card"/>
</div>
<div id="product-images">
    <g:render template="/mobile/common/product/images"/>
</div>
<g:render template="/mobile/common/product/variation"/>
<div id="product-card" class="acnt-btn">
    <g:render template="/mobile/common/product/actions"/>
</div>
<div >
    <g:render template="/mobile/common/product/description"/>
</div>
<div class="product-detail                                                                                                                                                                                                                                                          ">
    <p class="sku-no"><g:message code="invoice.productCode"/> : ${product.id}</p>
</div>
<g:render template="/mobile/common/product/specifications" model="${[categories: rootAttributeCategories]}"/>

<a href="${createLink(controller: 'site', action: 'shoppingRules')}">
    <div class="acnt-btn">
        <h3><g:message code="rules.shoppingRules"/></h3>
    </div>
</a>

<g:render template="/mobile/common/product/share"/>
<g:render template="/mobile/common/product/links"/>

</body>
</html>