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

<table class="layout-container table-simulated">
    <tr class="table-row">
        <td class="table-cell product-rightColumn">
            <div class="product-card">
                <div class="product-card-content" id="product-card">
                    <g:render template="product/card"
                              model="${[product: product, productModel: ProductModel.findByProductAndIsDefaultModel(product, true), addedValues: addedValues, selectedAddedValues: selectedAddedValues]}"/>
                </div>

                <div class="product-card-footer">
                    <eshop:addToCompareList prodcutId="${product.id}"
                                            productTitle="${product.toString()}"></eshop:addToCompareList>
                    <eshop:addToWishList prodcutId="${product.id}"
                                         productTitle="${product.toString()}"></eshop:addToWishList>
                </div>

                <div id="priceHistogramModal" class="modal hide fade" tabindex="-1" role="window"
                     aria-labelledby="priceHistogramModalLabel" aria-hidden="true" style="width: 700px;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                                onclick="hidePriceHistogram();">×</button>
                    </div>

                    <div class="modal-body">
                    </div>
                </div>
            </div>
        </td>

        <td class="table-cell">
            <table class="table-simulated">
                <tr class="table-row">
                    <td class="table-cell" style="padding-left:5px;">
                        <div style="float:left;padding-top:6px;">
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
                        </div>
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
                                    <td class="table-cell" id="product-description-area">

                                        <div class="white-panel">
                                            <div>
                                                <g:if test="${product?.pageTitle}">
                                                    <h1 class="font-koodak" itemprop="name">${product?.pageTitle}</h1>
                                                </g:if>
                                                <g:else>
                                                    <h1 class="font-koodak"
                                                        itemprop="name">${product?.productTypes?.find { true }?.name ?: ""} ${product?.type?.title ?: ""} ${product?.brand?.name ?: ""}</h1>

                                                    <h2 class="small" itemprop="model"><span
                                                            class="font-koodak"><g:message
                                                                code="productModel"/></span> <span
                                                            class="font-calibri">${product?.name ?: ""}</span></h2>
                                                </g:else>
                                            </div>


                                            <div itemprop="aggregateRating">
                                                <g:message code="rate"/>:
                                                <span class="meta" itemprop="value">${rate}</span>
                                                <meta itemprop="best" content="5"/>
                                                <eshop:rate identifier="hidProductRate" currentValue="${rate}"
                                                            readOnly="true"/>
                                            </div>

                                            <p class="brand-badge">
                                                <img width="80px" height="80px" itemprop="brand"
                                                     src="${createLink(controller: 'image', params: [id: product?.brand?.id, type: 'brand'])}"
                                                     alt="${product?.brand}"/>
                                            </p>

                                            <p>
                                                <g:message code="productCode.label"/>: <b>${params.id}</b>
                                            </p>


                                            <div id="product-price">
                                                <g:render template="product/price"
                                                          model="${[product: product, productModel: ProductModel.findByProductAndIsDefaultModel(product, true)]}"/>
                                            </div>

                                            <g:if test="${product.description}">
                                                <p itemprop="description">
                                                    ${product.description}
                                                </p>
                                            </g:if>

                                            <g:render template="product/variation"/>
                                        </div>
                                    </td>

                                    <td class="table-cell product-imageColumn">
                                        <div><g:render template="product/zoom"/></div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>

                <tr class="table-row">
                    <td class="table-cell">
                        <div class="white-panel">
                            <h3><g:message code="product.specifications"></g:message></h3>
                            <g:render template="product/attributes"
                                      model="${[categories: rootAttributeCategories]}"></g:render>

                            <hr/>
                            <g:render template="product/description"/>
                            <g:render template="../customerReview/resources"
                                      model="${['product': product]}"></g:render>
                            <g:render template="../customerReview/list"
                                      model="${['product': product]}"></g:render>
                            <g:render template="../customerReview/create"
                                      model="${['product': product]}"></g:render>
                            <hr/>
                            <g:render template="common/productCarousel"
                                      model="${[title: message(code: 'product.mostVisited.list', args: [breadCrumb.last().name]), productList: mostVisitedProducts]}"></g:render>
                        </div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

</body>
</html>