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
    <script language="javascript" src="${resource(dir: 'js', file: 'jquery.raty.js')}" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        var modal;
        function showPriceHistogram(id) {
            $("#priceHistogramModal .modal-body").html('<img class="loading" src="${resource(dir: 'images', file: 'loading.gif')}"/>');
            if (modal) {
                modal.show();
                $('#priceHistogramModal').addClass('in');
            }
            else {
                modal = $("#priceHistogramModal").modal({
                    backdrop: false,
                    show: true
                });
            }
            $("#priceHistogramModal .modal-body").load('${createLink(controller: 'productModel', action: 'priceHistogram')}/' + id, function () {
            });
        }

        function hidePriceHistogram() {
            $('#priceHistogramModal').removeClass('in');
            modal.hide();
        }

    </script>
</head>

<body>
<script language="javascript" src="${resource(dir: 'js', file: 'jquery.etalage.modified.js')}" type="text/javascript"></script>
<link href="${resource(dir: 'css', file: 'jquery.etalage.css')}" rel="stylesheet" type="text/css"/>

<div class="product-page-container">

<table class="layout-container table-simulated">
<tr class="table-row">
<g:set var="defaultModel" value="${ProductModel.findByProductAndIsDefaultModel(product, true)}"/>

<td class="table-cell">
    <table class="table-simulated" style="margin-left:40px;">
        <tr class="table-row">
            <td class="table-cell" style="padding-left:5px;">

                <ul class="breadcrumb">
                    <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
                        <a itemprop="url" href="${createLink(uri: '/')}">
                            <span itemprop="title">
                                <g:message code="home"/>
                            </span>
                        </a>
                    </li>
                    <g:if test="${breadCrumb.size() > 1}">
                        <g:each in="${breadCrumb[0..-1]}">
                            <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
                                <span class="divider">${">"}</span>
                                <a itemprop="url" href="${it.href}">
                                    <span itemprop="title">${it.name}</span>
                                </a>
                            </li>
                        </g:each>
                    </g:if>
                    <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
                        <span class="divider">${">"}</span>
                        <a href="${createLink(uri: '/product')}/${params.id}"
                           itemprop="url">
                            <span itemprop="title">
                                ${product.manualTitle ? product.pageTitle : title}
                            </span>
                        </a>
                    </li>
                </ul>
            </td>
        </tr>

        <tr class="table-row">
            <td class="table-cell">
                <div itemscope itemtype="http://schema.org/Product">
                    <table class="table-simulated">
                        <tr class="table-row">

                            <td class="table-cell product-imageColumn">
                                <div id="product-images">

                                    <g:render template="/site/goldaan/templates/product/zoom" key="${params.id}" model="[productModel:defaultModel]"/>

                                </div>
                                <g:if test="${product.description}">
                                    <div  itemprop="description" class="product-description">
                                        <p>
                                            ${product.description}
                                        </p>
                                    </div>
                                </g:if>
                            </td>
                            <td class="table-cell" id="product-description-area">

                                <div class="white-panel">
                                    <div>
                                        <a itemprop="url"  href="<g:createLink uri="/product/${product?.id}"/>">
                                            <g:if test="${product?.pageTitle}">
                                                <h1 class="font-koodak product-title"
                                                    itemprop="name">${product?.pageTitle}</h1>
                                            </g:if>
                                            <g:else>
                                                <h1 class="font-koodak product-title"
                                                    itemprop="name">${product?.productTypes?.find { true }?.name ?: ""} ${product?.type?.title ?: ""} ${product?.brand?.name ?: ""}</h1>

                                                <h2 class="small product-title" itemprop="model"><span class="font-calibri">${product?.name ?: ""}</span></h2>
                                            </g:else>
                                        </a>

                                    <div class="social-links">

                                    <div><a href="http://www.facebook.com/sharer.php?u=${createLink(uri: "/product/${params.id}", absolute: true)}"
                                    target="_blank"><img src="${resource(dir: 'images/social', file: 'facebook.png')}"/></a> </div>
                                    <div><a href="http://twitter.com/share?url=${createLink(uri: "/product/${params.id}", absolute: true)}&text=${product.manualTitle ? product.pageTitle : title}"
                                    target="_blank"><img src="${resource(dir: 'images/social', file: 'twitter.png')}"/></a> </div>
                                    %{--<div><a href="mailto:?${product.manualTitle ? product.pageTitle : title}&Body=I%20saw%20this%20and%20thought%20of%20you!%20 ${createLink(uri: "/product/${params.id}", absolute: true)}"><img--}%
                                    %{--src="${resource(dir: 'images/goldaan', file: 'email.png')}"/></a> </div>--}%
                                    <div><a href="https://plus.google.com/share?url=${createLink(uri: "/product/${params.id}", absolute: true)}"
                                    target="_blank"><img src="${resource(dir: 'images/social', file: 'google.png')}"/></a> </div>
                                    %{--<div><a href="https://instagram.com/goldaan"--}%
                                            %{--target="_blank"><img src="${resource(dir: 'images/social', file: 'instagram.png')}"/></a> </div>--}%
                                    %{--</div>--}%
                                    </div>
                                    <table class="table-simulated product-info">
                                        <tr>
                                            <td class="product-prices table-cell">
                                                <div class="product-card-content" id="product-card">
                                                    <g:render template="/site/goldaan/templates/product/card" key="${params.id}"
                                                        model="${[product: product, productModel: defaultModel, addedValues: addedValues, selectedAddedValues: selectedAddedValues]}"/>
                                                </div>
                                            </td>
                                            <td class="table-cell">
                                                <div class="product-variation-container">
                                                    <g:render template="product/variation" key="${params.id}"/>

                                                    <div class="product-additives">
                                                        <g:render template="product/additives"/>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>



                                </div>
                            </td>



                            %{--<td class="table-cell product-details">--}%
                                %{--<ul class="tabs rotate">--}%
                                    %{--<li class="product-specification"><g:message--}%
                                            %{--code="product.specifications"/></li>--}%
                                    %{--<li class="product-proOpinions"><g:message--}%
                                            %{--code="product.proOpinions"/></li>--}%
                                    %{--<li class="product-reviewList"><g:message--}%
                                            %{--code="product.review.list"/></li>--}%
                                    %{--<li class="product-upLink">&nbsp;</li>--}%
                                %{--</ul>--}%
                            %{--</td>--}%
                        </tr>
                    </table>
                </div>
            </td>
        </tr>

        <tr class="table-row">
            <td class="table-cell">
                <div class="white-panel">
                    %{--<ul class="tabs">--}%
                        %{--<li class="product-specification"><g:message code="product.specifications"/></li>--}%
                        %{--<li class="product-proOpinions"><g:message code="product.proOpinions"/></li>--}%
                        %{--<li class="product-reviewList"><g:message code="product.review.list"/></li>--}%
                    %{--</ul>--}%

                    %{--<div class="product-specification-panel">--}%
                        %{--<h3><g:message code="product.specifications"/></h3>--}%
                        %{--<ehcache:render template="product/attributes" key="${params.id}"--}%
                                        %{--model="${[categories: rootAttributeCategories]}"/>--}%
                    %{--</div>--}%
                    <g:if test="${product?.details}">
                        <div class="product-proOpinions-panel">
                            <h3><g:message code="product.proOpinions"/></h3>
                            <ehcache:render template="product/description" key="${params.id}"/>
                        </div>
                    </g:if>
                    <hr/>
                    <table class="table-simulated">
                        <tr>
                            <td class="product-reviewList-panel-td">
                                <div class="product-reviewList-panel">
                                    <g:render template="../customerReview/resources"
                                                    model="${['product': product]}"/>
                                    <g:render template="../customerReview/list"
                                                    model="${['product': product]}" key="${params.id}"/>
                                    <g:render template="../customerReview/create"
                                                    model="${['product': product]}"/>
                                </div>
                            </td>
                            <td class="vertical-align-top">
                                <div class="text-center">
                                    <g:render template="/site/goldaan/lastVisitedProducts"/>
                                    <g:render template="/site/goldaan/similarProducts"/>
                                </div>
                            </td>
                            <td></td>
                        </tr>
                    </table>



                </div>
            </td>
        </tr>
    </table>
</td>
</tr>
</table>

</div>
</body>
</html>