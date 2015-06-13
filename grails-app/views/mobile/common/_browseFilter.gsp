<div id="filter_slide_panel">
    <div class="main-width">
        <div class="singlepage-title">
            <h2 class="right page-title"><span class="red"><g:message code="filter"/></span></h2>

            <div class="left go-back" data-q="filters-back" id="div-filters-back"><h4><g:message code="back"/></h4>
            </div>
        </div>

        <div id="price" class="search-by-price">
            <h2 class="dummy_toggler"><g:message code="priceRangeSlider.title"/> (<eshop:currencyLabel/>)</h2>
            <g:render template="/mobile/common/priceFilter"/>
            <div class="clear"></div>
        </div>

        <g:if test="${filters?.brands}">
            <div class="by-brand" id="brandsname">
                <h2 id="toggle-brandsname" class="toggle-head dummy_toggler">
                    <g:message code="site.selectBrand" default="Select Brand"/><span class="grey"></span><span
                        class="up-arrow left">dummy</span></h2>

                <div id="toggled-brandsname" class="toggle-brand">
                    <form class="search-products" name="search-brand">
                        <input type="text" id="brandsname_filter_input" placeholder="${message(code: 'search.btn')}">
                    </form>

                    <form class="checked-products" id="frm-brandsname">

                        <g:each in="${filters.brands?.sort { -it.count }}" var="brand">
                            <div class="checkbox-group">
                                <eshop:filterStartBrandMobile productType="${productType}" brandId="${brand?._id?.id}"
                                                              brandName="${brand?._id?.name}" showCount="true"
                                                              count="${brand.count}"/>
                            </div>
                        </g:each>
                    </form>
                </div>
            </div>
        </g:if>



        <g:if test="${filters?.attributes}">

        %{--attribute categories--}%
            <g:each in="${filters.attributes.findAll { it.value.type == 'ac' && it.value.countsByValue.size() > 0 }}"
                    var="attribute" status="indexer">

                <div class="by-brand" id="ac-${attribute.value.type.replace("a", "") + attribute.key}">
                    <h2 id="toggle-${attribute.value.type.replace("a", "") + attribute.key}"
                        class="toggle-head dummy_toggler">${attribute.value.name}<span
                            class="grey"></span><span class="up-arrow left">dummy</span></h2>

                    <div id="toggled-${attribute.value.type.replace("a", "") + attribute.key}" class="toggle-brand">
                        <form class="checked-products"
                              id="frm-${attribute.value.type.replace("a", "") + attribute.key}">
                            <g:each in="${attribute.value.countsByValue.sort { -it.count }}" var="attributeValueCount">
                                <div class="checkbox-group">
                                    <eshop:filterStartMobile productType="${productType}"
                                                             attribute="${attribute.value.type.replace("a", "") + attribute.key}"
                                                             value="${attributeValueCount?._id}" showCount="true"
                                                             count="${attributeValueCount.count}"/>
                                </div>
                            </g:each>
                        </form>
                    </div>
                </div>
            </g:each>
        %{--attributes--}%
            <g:each in="${filters.attributes.findAll { it.value.type == 'a' && it.value.countsByValue.size() > 0 }}"
                    var="attribute" status="indexer">
                <div class="by-brand" id="a-${attribute.value.type.replace("a", "") + attribute.key}">
                    <h2 id="toggle-${attribute.value.type.replace("a", "") + attribute.key}"
                        class="toggle-head dummy_toggler">${attribute.value.name}<span
                            class="grey"></span><span class="up-arrow left">dummy</span></h2>

                    <div id="toggled-${attribute.value.type.replace("a", "") + attribute.key}" class="toggle-brand">
                        <form class="checked-products"
                              id="frm-${attribute.value.type.replace("a", "") + attribute.key}">
                            <g:each in="${attribute.value.countsByValue.sort { -it.count }}" var="attributeValueCount">
                                <div class="checkbox-group">
                                    <eshop:filterStartMobile productType="${productType}"
                                                             attribute="${attribute.value.type.replace("a", "") + attribute.key}"
                                                             value="${attributeValueCount?._id}" showCount="true"
                                                             count="${attributeValueCount.count}"/>
                                </div>
                            </g:each>
                        </form>
                    </div>
                </div>
            </g:each>
        </g:if>

    %{--Variation Filters--}%
        <g:if test="${productType.children.count { it } == 0}">
            <g:if test="${filters?.variations}">
                <g:each in="${filters.variations}" var="variationGroup" status="indexer">
                    <g:if test="${variationGroup.value.countsByValue.count { it } > 0}">
                        <div class="by-brand" id="v-${variationGroup.value.type.replace('v', '') + variationGroup.key}">
                            <h2 id="toggle-v-${variationGroup.value.type.replace('v', '') + variationGroup.key}" class="toggle-head dummy_toggler">${variationGroup.value.name}<span
                                    class="grey"></span><span
                                    class="up-arrow left">dummy</span></h2>

                            <div id="toggled-v-${variationGroup.value.type.replace('v', '') + variationGroup.key}" class="toggle-brand">
                                <form class="checked-products" id="frm-v-${variationGroup.value.type.replace('v', '') + variationGroup.key}">
                                    <div class="checkbox-group">
                                        <eshop:filterStartVariationMobile productType="${productType}"
                                                                    variation="${variationGroup.value.type.replace('v', '') + variationGroup.key}"
                                                                    value="${variationValueCount?._id}" showCount="true"
                                                                    count="${variationValueCount.count}"/>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </g:if>
                </g:each>
            </g:if>
        </g:if>

    </div>
</div>

<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $('.filterCheckbox').each(function () {
            $(this).click(function () {
                closeFilterPanel();
                window.location.href = $(this).attr('data-url');
            });
        })
    });
</script>