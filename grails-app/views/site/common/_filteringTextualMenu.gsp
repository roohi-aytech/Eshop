<ul class="nav nav-list">
<g:if test="${filters.productTypes}">
    <li class="nav-header"><g:message code="site.selectSubcategory"
                                      default="Select SubProductType"/></li>
    <g:each in="${filters.productTypes}" var="productType">
        <li class="sub-category">
            <eshop:filterAddProductType id="${productType._id.id}" name="${productType._id.name}"
                                        f="${params.f}"/>
        </li>
    </g:each>
    <li class="divider"></li>
</g:if>

<g:if test="${filters?.types && filters?.types?.size() > 1}">
    <li class="nav-header"><g:message code="site.selectProductTypeType"
                                      default="Select SubcategoryType"/></li>
    <g:each in="${filters?.types}"
            var="type">
        <li class="sub-category">
            <a href="${createLink(action: "filter", params: [f: "${params.f},t${type._id.id}"])}">
                ${type._id.name} <span class='count'>(${type.count})</span>
            </a>
        </li>
    </g:each>
    <li class="divider"></li>
</g:if>
%{--price range--}%

<li class="nav-header"><g:message code="filter.price.range" default="Price Range"/></li>
<li>

    <div class="price-filter-form">
        <input type="text" class="priceRange" id="priceRangeFrom"
               value="${params.f?.split(',')?.find { it?.toString()?.startsWith('rf') }?.replace('rf', '') ?: ''}"
               onkeyup="formatPrice(this)"/>
        <g:message code="filter.price.range.last"/>
        <input type="text" class="priceRange" id="priceRangeTo"
               value="${params.f?.split(',')?.find { it?.toString()?.startsWith('rt') }?.replace('rt', '') ?: ''}"
               onkeyup="formatPrice(this)"/>
    </div>

    <div class="price-filter-toolbar">
        <input type="button" class="btn btn-danger" onclick="filterByPrice();" value="${message(code:'priceFilter.apply')}"/>
        <g:if test="${params.f?.toString()?.contains('rf') || params.f?.toString()?.contains('rt')}">
            <g:set var="params_f" value="${params.f.replace(',' + params.f?.split(',')?.find {it?.toString()?.startsWith('rf')}, '').replace(',' + params.f?.split(',')?.find {it?.toString()?.startsWith('rt')}, '')}"/>
            <g:if test="${params.action == 'filter'}">
                <g:set var="clearPriceFilterUrl" value="${createLink(controller: 'site', action: 'filter', params: [f: params.f])}"/>
            </g:if>
            <g:if test="${params.action == 'search'}">
                <g:set var="clearPriceFilterUrl" value="${createLink(controller: 'site', action: 'filter', params: [phrase: params.phrase, f: params.f])}"/>
            </g:if>
            <a href="${clearPriceFilterUrl}" class="btn btn-inverse clearFilter"><g:message code="priceFilter.clear"/></a>
        </g:if>
    </div>
    <script language="JavaScript" type="text/javascript">
        function filterByPrice() {
            var priceFilterFrom = $('#priceRangeFrom').val().replace(/,/g, '');
            var priceFilterTo = $('#priceRangeTo').val().replace(/,/g, '');
            var params_f = '${params.f.replace(',' + params.f?.split(',')?.find {it?.toString()?.startsWith('rf')}, '').replace(',' + params.f?.split(',')?.find {it?.toString()?.startsWith('rt')}, '')}';
            <g:if test="${params.action == 'filter'}">
            var url = '${createLink(controller: 'site', action: 'filter')}';
            url += '?f=' + params_f;
            if (priceFilterFrom)
                url += ',rf' + priceFilterFrom;
            if (priceFilterTo)
                url += ',rt' + priceFilterTo;
            url += '&o=r'
            </g:if>
            <g:if test="${params.action == 'search'}">
            var url = '${createLink(controller: 'site', action: 'search', params: [phrase:params.phrase])}';
            url += '&f=' + params_f;
            if (priceFilterFrom)
                url += ',rf' + priceFilterFrom;
            if (priceFilterTo)
                url += ',rt' + priceFilterTo;
            url += '&o=r'
            </g:if>
            window.location.href = url;
        }

        function formatPrice(item) {
            $(item).val(addCommasOnKeyPress($(item).val()));
        }

        function addCommasOnKeyPress(nStr) {
            nStr = nStr.replace(/\,/g, '');
            nStr += '';
            var x = nStr.split('.');
            var x1 = x[0];
            var x2 = x.length > 1 ? '.' + x[1] : '';
            var rgx = /(\d+)(\d{3})/;
            while (rgx.test(x1)) {
                x1 = x1.replace(rgx, '$1' + ',' + '$2');
            }
            return x1 + x2;
        }

        $(".priceRange").keydown(function (e) {
            if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
                    (e.keyCode == 65 && e.ctrlKey === true) ||
                    (e.keyCode >= 35 && e.keyCode <= 39)) {
                return;
            }
            if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                e.preventDefault();
            }
        });

        formatPrice($('#priceRangeFrom'));
        formatPrice($('#priceRangeTo'));
    </script>
</li>
%{--Brands Filters--}%
<g:if test="${filters?.brands}">
    <li class="nav-header sidebarBrandGroup"><g:message code="site.selectBrand"
                                                        default="Select Brand"/></li>
    <g:each in="${filters.brands?.count { it } > 5 ? filters.brands?.sort { -it.count }[0..4] : filters.brands?.sort {
        -it.count
    }}"
            var="brand">
        <g:if test="${filters.selecteds["b"]?.contains(brand._id?.id)}">
            <li class="active checkable">
                <eshop:filterAddBrand id="${brand._id.id}" name="${brand._id.name}" f="${params.f}"
                                      remove="true" showCount="true" count="${brand.count}"/>
            </li>
        </g:if>
        <g:else>
            <li class="checkable">
                <eshop:filterAddBrand id="${brand._id.id}" name="${brand._id.name}"
                                      f="${params.f}" showCount="true" count="${brand.count}"/>
            </li>
        </g:else>
    </g:each>

    <g:if test="${filters.brands?.count { it } > 5}">
        <g:each in="${filters.brands?.sort { -it.count }[5..(filters.brands.count { it } - 1)]}" var="brand">
            <g:if test="${filters.selecteds["b"]?.contains(brand._id?.id)}">
                <li class="active checkable moreBrandItems">
                    <eshop:filterAddBrand id="${brand._id.id}" name="${brand._id.name}" f="${params.f}"
                                          remove="true" showCount="true" count="${brand.count}"/>
                </li>
            </g:if>
            <g:else>
                <li class="checkable moreItems moreBrandItems">
                    <eshop:filterAddBrand id="${brand._id.id}" name="${brand._id.name}"
                                          f="${params.f}" showCount="true" count="${brand.count}"/>
                </li>
            </g:else>
        </g:each>

        <li class="moreItemsLink"><a onclick="$(this).parent().hide();
        $(this).parent().next().fadeIn();
        $('.moreBrandItems').fadeIn('slow');"><g:message code="more"/></a></li>
        <li class="moreItems moreItemsLink"><a onclick="$(this).parent().hide();
        $(this).parent().prev().fadeIn();
        $('.moreBrandItems').hide('fast');"><g:message code="less"/></a></li>
    </g:if>
</g:if>
<li class="divider"></li>
%{--Attribute Filters--}%
<g:if test="${filters?.attributes}">
    <g:each in="${filters.attributes.findAll { it.value.countsByValue.size() > 0 }}" var="attribute" status="indexer">
        <li class="nav-header sidebarAttributeGroup">${attribute.value.name}</li>
        <g:each in="${attribute.value.countsByValue.count { it } > 5 ? attribute.value.countsByValue.sort {
            -it.count
        }[0..4] : attribute.value.countsByValue.sort { -it.count }}"
                var="attributeValueCount">
            <g:if test="${filters.selecteds[attribute.key]?.contains(attributeValueCount._id)}">
                <li class="active checkable">
                    <eshop:filterAddAttribute id="${attribute.value.type.replace("a", "") + attribute.key}"
                                              value="${attributeValueCount._id}" f="${params.f}"
                                              remove="true" showCount="true" count="${attributeValueCount.count}"/>
                </li>
            </g:if>
            <g:else>
                <li class="checkable">
                    <eshop:filterAddAttribute id="${attribute.value.type.replace("a", "") + attribute.key}"
                                              value="${attributeValueCount._id}"
                                              f="${params.f}" showCount="true"
                                              count="${attributeValueCount.count}"/></li>
            </g:else>
        </g:each>


        <g:if test="${attribute.value.countsByValue.count { it } > 5}">
            <g:each in="${attribute.value.countsByValue.sort { -it.count }[5..(attribute.value.countsByValue.count {
                it
            } - 1)]}"
                    var="attributeValueCount">
                <g:if test="${filters.selecteds[attribute.key]?.contains(attributeValueCount._id)}">
                    <li class="active checkable">
                        <eshop:filterAddAttribute id="${attribute.value.type.replace("a", "") + attribute.key}"
                                                  value="${attributeValueCount._id}" f="${params.f}"
                                                  remove="true" showCount="true" count="${attributeValueCount.count}"/>
                    </li>
                </g:if>
                <g:else>
                    <li class="checkable moreItems moreAttributeItems${indexer}">
                        <eshop:filterAddAttribute id="${attribute.value.type.replace("a", "") + attribute.key}"
                                                  value="${attributeValueCount._id}"
                                                  f="${params.f}" showCount="true"
                                                  count="${attributeValueCount.count}"/></li>
                </g:else>
            </g:each>

            <li class="moreItemsLink"><a onclick='$(this).parent().hide();
            $(this).parent().next().fadeIn();
            $(".moreAttributeItems${indexer}").fadeIn("slow");'><g:message code="more"/></a></li>
            <li class="moreItems moreItemsLink"><a onclick='$(this).parent().hide();
            $(this).parent().prev().fadeIn();
            $(".moreAttributeItems${indexer}").hide("fast");'><g:message code="less"/></a></li>
        </g:if>
    </g:each>
</g:if>

%{--Variation Filters--}%
<g:if test="${filters.productTypes.count { it } == 0}">
    <g:if test="${filters?.variations}">
        <g:each in="${filters.variations}" var="variationGroup" status="indexer">
            <g:if test="${variationGroup.value.countsByValue.count { it } > 0}">
                <li class="nav-header sidebarAttributeGroup">${variationGroup.value.name}</li>
                <g:each in="${variationGroup.value.countsByValue.count {
                    it
                } > 5 ? variationGroup.value.countsByValue.sort {
                    -it.count
                }[0..4] : variationGroup.value.countsByValue.sort { -it.count }}"
                        var="variationValueCount">
                    <g:if test="${filters.selecteds[variationGroup.key]?.contains(variationValueCount._id)}">
                        <li class="active checkable">
                            <eshop:filterAddVariation
                                    id="${variationGroup.value.type.replace("v", "") + variationGroup.key}"
                                    value="${variationValueCount._id}" f="${params.f}"
                                    remove="true" showCount="true" count="${variationValueCount.count}"/>
                        </li>
                    </g:if>
                    <g:else>
                        <li class="checkable">
                            <eshop:filterAddVariation
                                    id="${variationGroup.value.type.replace("a", "") + variationGroup.key}"
                                    value="${variationValueCount._id}"
                                    f="${params.f}" showCount="true" count="${variationValueCount.count}"/></li>
                    </g:else>
                </g:each>

                <g:if test="${variationGroup.value.countsByValue.count { it } > 5}">
                    <g:each in="${variationGroup.value.countsByValue.sort {
                        -it.count
                    }[5..(variationGroup.value.countsByValue.count { it } - 1)]}"
                            var="variationValueCount">
                        <g:if test="${filters.selecteds[variationGroup.key]?.contains(variationValueCount._id)}">
                            <li class="active checkable">
                                <eshop:filterAddVariation
                                        id="${variationGroup.value.type.replace("v", "") + variationGroup.key}"
                                        value="${variationValueCount._id}" f="${params.f}"
                                        remove="true" showCount="true" count="${variationValueCount.count}"/>
                            </li>
                        </g:if>
                        <g:else>
                            <li class="checkable moreItems moreVariationItems${indexer}">
                                <eshop:filterAddVariation
                                        id="${variationGroup.value.type.replace("a", "") + variationGroup.key}"
                                        value="${variationValueCount._id}"
                                        f="${params.f}" showCount="true" count="${variationValueCount.count}"/></li>
                        </g:else>
                    </g:each>

                    <li class="moreItemsLink"><a onclick='$(this).parent().hide();
                    $(this).parent().next().fadeIn();
                    $(".moreVariationItems${indexer}").fadeIn("slow");'><g:message code="more"/></a></li>
                    <li class="moreItems moreItemsLink"><a onclick='$(this).parent().hide();
                    $(this).parent().prev().fadeIn();
                    $(".moreVariationItems${indexer}").hide("fast");'><g:message code="less"/></a>
                    </li>
                </g:if>

            </g:if>
        </g:each>
        <li class="divider"></li>
    </g:if>
</g:if>
</ul>