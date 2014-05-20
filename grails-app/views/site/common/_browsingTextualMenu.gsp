<ul class="nav nav-list">
<g:if test="${productType.children}">
    <li class="nav-header"><g:message code="site.selectSubcategory"
                                      default="Select SubProductType"/></li>
    <g:each in="${subProductTypeLinks}" var="subProductTypeLink">
        <li class="sub-category"><a href="${subProductTypeLink.href}">${subProductTypeLink.name}</a></li>
    </g:each>
    <li class="divider"></li>
</g:if>
<g:if test="${filters?.types && filters?.types?.size() > 1}">
    <li class="nav-header"><g:message code="site.selectProductTypeType"
                                      default="Select SubcategoryType"/></li>
    <g:each in="${filters?.types}"
            var="type">
        <li class="sub-category">
            <a href="${createLink(action: "filter", params: [f: "p${productTypeId},t${type._id.id}"])}">
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
        <input type="text" class="priceRange" id="priceRangeFrom" onkeyup="formatPrice(this)"/>
        <g:message code="filter.price.range.last"/>
        <input type="text" class="priceRange" id="priceRangeTo" onkeyup="formatPrice(this)"/>
    </div>

    <div class="price-filter-toolbar">
        <input type="button" class="btn btn-danger" onclick="filterByPrice();" value="${message(code:'priceFilter.apply')}"/>
    </div>
    <script language="JavaScript" type="text/javascript">
        function filterByPrice() {
            var priceFilterFrom = $('#priceRangeFrom').val().replace(/,/g, '');
            var priceFilterTo = $('#priceRangeTo').val().replace(/,/g, '');
            var params_f = 'p${productType.id}';
            var url = '${createLink(controller: 'site', action: 'filter')}';
            url += '?f=' + params_f;
            if (priceFilterFrom)
                url += ',rf' + priceFilterFrom;
            if (priceFilterTo)
                url += ',rt' + priceFilterTo;
            url += '&o=r'
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
    </script>
</li>

<li class="divider"></li>
%{--Brands Filters--}%
<g:if test="${filters?.brands}">
    <li class="nav-header sidebarBrandGroup"><g:message code="site.selectBrand"
                                                        default="Select Brand"/></li>

    <g:each in="${filters.brands?.count { it } > 5 ? filters.brands?.sort {
        -it.count
    }[0..4] : filters.brands?.sort { -it.count }}"
            var="brand">
        <li class="checkable">
            <eshop:filterStartBrand productType="${productType}" brandId="${brand._id?.id}"
                                    brandName="${brand._id?.name}" showCount="true" count="${brand.count}"/>
        </li>
    </g:each>

    <g:if test="${filters.brands?.count { it } > 5}">
        <g:each in="${filters.brands?.sort { -it.count }[5..(filters.brands.count { it } - 1)]}" var="brand">
            <li class="checkable moreItems moreBrandItems">
                <eshop:filterStartBrand productType="${productType}" brandId="${brand._id?.id}"
                                        brandName="${brand._id?.name}" showCount="true" count="${brand.count}"/>
            </li>
        </g:each>

        <li class="moreItemsLink"><a onclick="$(this).parent().hide();
        $(this).parent().next().fadeIn();
        $(this).parent().next().fadeIn();
        $('.moreBrandItems').fadeIn('slow');"><g:message code="more"/></a></li>
        <li class="moreItems moreItemsLink"><a onclick="$(this).parent().hide();
        $(this).parent().prev().fadeIn();
        $('.moreBrandItems').hide('fast');"><g:message code="less"/></a></li>
    </g:if>

    <li class="divider"></li>
</g:if>

%{--Attribute Filters--}%
<g:if test="${filters?.attributes}">
%{--attribute categories--}%
    <g:each in="${filters.attributes.findAll { it.value.type == 'ac' && it.value.countsByValue.size() > 0 }}"
            var="attribute" status="indexer">
        <li class="nav-header sidebarAttributeGroup">${attribute.value.name}</li>
        <g:each in="${attribute.value.countsByValue.count { it } > 5 ? attribute.value.countsByValue.sort {
            -it.count
        }[0..4] : attribute.value.countsByValue.sort { -it.count }}"
                var="attributeValueCount">
            <li class="checkable">
                <eshop:filterStart productType="${productType}"
                                   attribute="${attribute.value.type.replace("a", "") + attribute.key}"
                                   value="${attributeValueCount._id}" showCount="true"
                                   count="${attributeValueCount.count}"/>
            </li>
        </g:each>

        <g:if test="${attribute.value.countsByValue.count { it } > 5}">
            <g:each in="${attribute.value.countsByValue.sort { -it.count }[5..(attribute.value.countsByValue.count {
                it
            } - 1)]}"
                    var="attributeValueCount">
                <li class="checkable moreItems moreAttributeItems${indexer}">
                    <eshop:filterStart productType="${productType}"
                                       attribute="${attribute.value.type.replace("a", "") + attribute.key}"
                                       value="${attributeValueCount._id}" showCount="true"
                                       count="${attributeValueCount.count}"/>
                </li>
            </g:each>

            <li class="moreItemsLink"><a onclick='$(this).parent().hide();
            $(this).parent().next().fadeIn();
            $(".moreAttributeItems${indexer}").fadeIn("slow");'><g:message code="more"/></a></li>
            <li class="moreItems moreItemsLink"><a onclick='$(this).parent().hide();
            $(this).parent().prev().fadeIn();
            $(".moreAttributeItems${indexer}").hide("fast");'><g:message code="less"/></a></li>
        </g:if>
    </g:each>

%{--attributes--}%
    <g:each in="${filters.attributes.findAll { it.value.type == 'a' && it.value.countsByValue.size() > 0 }}"
            var="attribute" status="indexer">
        <li class="nav-header sidebarAttributeGroup">${attribute.value.name}</li>
        <g:each in="${attribute.value.countsByValue.count { it } > 5 ? attribute.value.countsByValue.sort {
            -it.count
        }[0..4] : attribute.value.countsByValue.sort { -it.count }}"
                var="attributeValueCount">
            <li class="checkable">
                <eshop:filterStart productType="${productType}"
                                   attribute="${attribute.value.type.replace("a", "") + attribute.key}"
                                   value="${attributeValueCount._id}" showCount="true"
                                   count="${attributeValueCount.count}"/>
            </li>
        </g:each>

        <g:if test="${attribute.value.countsByValue.count { it } > 5}">
            <g:each in="${attribute.value.countsByValue.sort { -it.count }[5..(attribute.value.countsByValue.count {
                it
            } - 1)]}"
                    var="attributeValueCount">
                <li class="checkable moreItems moreAttributeItems${indexer}">
                    <eshop:filterStart productType="${productType}"
                                       attribute="${attribute.value.type.replace("a", "") + attribute.key}"
                                       value="${attributeValueCount._id}" showCount="true"
                                       count="${attributeValueCount.count}"/>
                </li>
            </g:each>

            <li class="moreItemsLink"><a onclick='$(this).parent().hide();
            $(this).parent().next().fadeIn();
            $(".moreAttributeItems${indexer}").fadeIn("slow");'><g:message code="more"/></a></li>
            <li class="moreItems moreItemsLink"><a onclick='$(this).parent().hide();
            $(this).parent().prev().fadeIn();
            $(".moreAttributeItems${indexer}").hide("fast");'><g:message code="less"/></a></li>
        </g:if>
    </g:each>
    <li class="divider"></li>
</g:if>

%{--Variation Filters--}%
<g:if test="${productType.children.count { it } == 0}">
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
                    <li class="checkable">
                        <eshop:filterStartVariation productType="${productType}"
                                                    variation="${variationGroup.value.type + variationGroup.key}"
                                                    value="${variationValueCount._id}" showCount="true"
                                                    count="${variationValueCount.count}"/>
                    </li>
                </g:each>

                <g:if test="${variationGroup.value.countsByValue.count { it } > 5}">
                    <g:each in="${variationGroup.value.countsByValue.sort {
                        -it.count
                    }[5..(variationGroup.value.countsByValue.count { it } - 1)]}"
                            var="variationValueCount">
                        <li class="checkable moreItems moreVariationItems${indexer}">
                            <eshop:filterStartVariation productType="${productType}"
                                                        variation="${variationGroup.value.type + variationGroup.key}"
                                                        value="${variationValueCount._id}" showCount="true"
                                                        count="${variationValueCount.count}"/>
                        </li>
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