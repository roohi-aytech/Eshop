<%@ page import="eshop.ProductModel" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html dir="rtl">
<head>
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

<div class="product-page-container">
    <div style="float: left;height: 27px;margin-top: -3px;padding-top: 6px;width: 70px;z-index: 1000;">

        <g:if test="${grailsApplication.config.instance == 'Local'}">
            <div class="g-plusone"></div>

            <script type="text/javascript">
                window.___gcfg = {lang: 'fa'};

                (function () {
                    var po = document.createElement('script');
                    po.type = 'text/javascript';
                    po.async = true;
                    po.src = 'https://apis.google.com/js/plusone.js';
                    var s = document.getElementsByTagName('script')[0];
                    s.parentNode.insertBefore(po, s);
                })();
            </script>
        </g:if>
    </div>
    <ul class="breadcrumb">
        <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
            <a href="${createLink(uri: '/')}" itemprop="url" class="home">
                <span itemprop="title">
                    <g:message code="home"/>
                </span>
            </a>
        </li>
        <g:if test="${breadCrumb.size() > 1}">
            <g:each in="${breadCrumb[0..-1]}">
                <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
                    <span class="divider">${"/"}</span>
                    <a itemprop="url" href="${it.href}">
                        <span itemprop="title">${it.name}</span>
                    </a>
                </li>
            </g:each>
        </g:if>
        <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
            <span class="divider">${"/"}</span>
            <a href="${createLink(uri: '/product')}/${params.id}"
               itemprop="url">
                <span itemprop="title">
                    ${product.manualTitle ? product.pageTitle : title}
                </span>
            </a>
        </li>
    </ul>
    <div class="clearfix"></div>

    <g:render template="/site/felfel/templates/productQuickView"/>

    <div class="terms_conditions">
        <h2>
            <g:message code="description"/>
        </h2>

        <div class="terms_conditions_left">
            <p itemprop="description">
                ${product?.description}
            </p>

            <div class="section_title">
                <g:message code="product.specifications"/>
            </div>
            <g:render template="product/attributes" key="${params.id}"
                      model="${[categories: rootAttributeCategories]}"/>

            <div class="section_title">
                <g:message code="product.proOpinions"/>
            </div>

            <p itemprop="description">
                ${product?.details}
            </p>


            <g:render template="../customerReview/resources"
                      model="${['product': product]}"/>
            <g:render template="../customerReview/list"
                      model="${['product': product]}" key="${params.id}"/>
            <g:render template="../customerReview/create"
                      model="${['product': product]}"/>
        </div>

        <div class="terms_conditions_right">
            <div class="more_from_brand">
                <div class="header"><g:message code="product.mostVisited.list"
                                               args="${[breadCrumb.last().name]}"/></div>
                <g:each in="${mostVisitedProducts}" var="product">
                    <g:render template="/site/felfel/templates/productSmallThumbnail" model="${[product:product]}"/>
                </g:each>
            </div>
        </div>
    </div>

</div>

</body>
</html>