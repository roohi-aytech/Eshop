<ul class="nav nav-list">

<li class="nav-header">
    <g:message code="sort.label"/>
</li>
<li class="sub-category">
    <g:render template="common/sortFilter"/>
</li>

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
                                                    variation="${variationGroup.value.type.replace('v', '') + variationGroup.key}"
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
                                                        variation="${variationGroup.value.type.replace('v', '') + variationGroup.key}"
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