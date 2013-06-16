<ul class="nav nav-list">
    <g:if test="${filters.productTypes}">
        <li class="nav-header"><g:message code="site.selectSubcategory"
                                          default="Select SubProductType"></g:message></li>
        <g:each in="${filters.productTypes}" var="productType">
            <li>
                <eshop:filterAddProductType id="${productType._id.id}" name="${productType._id.name}"
                                            f="${params.f}"/>
            </li>
        </g:each>
        <li class="divider"></li>
    </g:if>
%{--Brands Filters--}%
    <g:if test="${filters?.brands}">
        <li class="nav-header sidebarBrandGroup"><g:message code="site.selectBrand"
                                                            default="Select Brand"></g:message></li>
        <g:each in="${filters.brands?.count { it } > 5 ? filters.brands?.sort { -it.count }[0..4] : filters.brands?.sort { -it.count }}"
                var="brand">
            <g:if test="${filters.selecteds["b"]?.contains(brand._id?.id)}">
                <li class="active checkable">
                    <eshop:filterAddBrand id="${brand._id.id}" name="${brand._id.name}" f="${params.f}"
                                          remove="true"></eshop:filterAddBrand>
                </li>
            </g:if>
            <g:else>
                <li class="checkable">
                    <eshop:filterAddBrand id="${brand._id.id}" name="${brand._id.name}"
                                          f="${params.f}"></eshop:filterAddBrand>
                </li>
            </g:else>
        </g:each>

        <g:if test="${filters.brands?.count { it } > 5}">
            <g:each in="${filters.brands?.sort { -it.count }[5..(filters.brands.count { it } - 1)]}" var="brand">
                <g:if test="${filters.selecteds["b"]?.contains(brand._id?.id)}">
                    <li class="active checkable moreBrandItems">
                        <eshop:filterAddBrand id="${brand._id.id}" name="${brand._id.name}" f="${params.f}"
                                              remove="true"></eshop:filterAddBrand>
                    </li>
                </g:if>
                <g:else>
                    <li class="checkable moreItems moreBrandItems">
                        <eshop:filterAddBrand id="${brand._id.id}" name="${brand._id.name}"
                                              f="${params.f}"></eshop:filterAddBrand>
                    </li>
                </g:else>
            </g:each>

            <li><a onclick="$(this).parent().fadeOut();
            $(this).parent().next().fadeIn();
            $('.moreBrandItems').fadeIn('slow');"><g:message code="more"></g:message></a></li>
            <li class="moreItems"><a onclick="$(this).parent().fadeOut();
            $(this).parent().prev().fadeIn();
            $('.moreBrandItems').fadeOut('fast');"><g:message code="less"></g:message></a></li>
        </g:if>
    </g:if>
    <li class="divider"></li>
%{--Attribute Filters--}%
    <g:if test="${filters?.attributes}">
        <g:each in="${filters.attributes}" var="attribute" status="indexer">
            <li class="nav-header sidebarAttributeGroup">${attribute.value.name}</li>
            <g:each in="${attribute.value.countsByValue.count { it } > 5 ? attribute.value.countsByValue.sort { -it.count }[0..4] : attribute.value.countsByValue.sort { -it.count }}"
                    var="attributeValueCount">
                <g:if test="${filters.selecteds[attribute.key]?.contains(attributeValueCount._id)}">
                    <li class="active checkable">
                        <eshop:filterAddAttribute id="${attribute.value.type.replace("a", "") + attribute.key}"
                                                  value="${attributeValueCount._id}" f="${params.f}"
                                                  remove="true"></eshop:filterAddAttribute>
                    </li>
                </g:if>
                <g:else>
                    <li class="checkable">
                        <eshop:filterAddAttribute id="${attribute.value.type.replace("a", "") + attribute.key}"
                                                  value="${attributeValueCount._id}"
                                                  f="${params.f}"></eshop:filterAddAttribute></li>
                </g:else>
            </g:each>


            <g:if test="${attribute.value.countsByValue.count { it } > 5}">
                <g:each in="${attribute.value.countsByValue.sort { -it.count }[5..(attribute.value.countsByValue.count { it } - 1)]}"
                        var="attributeValueCount">
                    <g:if test="${filters.selecteds[attribute.key]?.contains(attributeValueCount._id)}">
                        <li class="active checkable">
                            <eshop:filterAddAttribute id="${attribute.value.type.replace("a", "") + attribute.key}"
                                                      value="${attributeValueCount._id}" f="${params.f}"
                                                      remove="true"></eshop:filterAddAttribute>
                        </li>
                    </g:if>
                    <g:else>
                        <li class="checkable moreItems moreAttributeItems${indexer}">
                            <eshop:filterAddAttribute id="${attribute.value.type.replace("a", "") + attribute.key}"
                                                      value="${attributeValueCount._id}"
                                                      f="${params.f}"></eshop:filterAddAttribute></li>
                    </g:else>
                </g:each>

                <li><a onclick='$(this).parent().fadeOut();
                $(this).parent().next().fadeIn();
                $(".moreAttributeItems${indexer}").fadeIn("slow");'><g:message code="more"></g:message></a></li>
                <li class="moreItems"><a onclick='$(this).parent().fadeOut();
                $(this).parent().prev().fadeIn();
                $(".moreAttributeItems${indexer}").fadeOut("fast");'><g:message code="less"></g:message></a></li>
            </g:if>
        </g:each>
    </g:if>

%{--Variation Filters--}%
    <g:if test="${filters.productTypes.count { it } == 0}">
        <g:if test="${filters?.variations}">
            <g:each in="${filters.variations}" var="variationGroup" status="indexer">
                <g:if test="${variationGroup.value.countsByValue.count { it } > 0}">
                    <li class="nav-header sidebarAttributeGroup">${variationGroup.value.name}</li>
                    <g:each in="${variationGroup.value.countsByValue.count { it } > 5 ? variationGroup.value.countsByValue.sort { -it.count }[0..4] : variationGroup.value.countsByValue.sort { -it.count }}"
                            var="variationValueCount">
                        <g:if test="${filters.selecteds[variationGroup.key]?.contains(variationValueCount._id.name)}">
                            <li class="active checkable">
                                <eshop:filterAddVariation
                                        id="${variationGroup.value.type.replace("v", "") + variationGroup.key}"
                                        value="${variationValueCount._id.name}" f="${params.f}"
                                        remove="true"></eshop:filterAddVariation>
                            </li>
                        </g:if>
                        <g:else>
                            <li class="checkable">
                                <eshop:filterAddVariation
                                        id="${variationGroup.value.type.replace("a", "") + variationGroup.key}"
                                        value="${variationValueCount._id.name}"
                                        f="${params.f}"></eshop:filterAddVariation></li>
                        </g:else>
                    </g:each>

                    <g:if test="${variationGroup.value.countsByValue.count { it } > 5}">
                        <g:each in="${variationGroup.value.countsByValue.sort { -it.count }[5..(variationGroup.value.countsByValue.count { it } - 1)]}"
                                var="variationValueCount">
                            <g:if test="${filters.selecteds[variationGroup.key]?.contains(variationValueCount._id.name)}">
                                <li class="active checkable">
                                    <eshop:filterAddVariation
                                            id="${variationGroup.value.type.replace("v", "") + variationGroup.key}"
                                            value="${variationValueCount._id.name}" f="${params.f}"
                                            remove="true"></eshop:filterAddVariation>
                                </li>
                            </g:if>
                            <g:else>
                                <li class="checkable">
                                    <eshop:filterAddVariation
                                            id="${variationGroup.value.type.replace("a", "") + variationGroup.key}"
                                            value="${variationValueCount._id.name}"
                                            f="${params.f}"></eshop:filterAddVariation></li>
                            </g:else>
                        </g:each>

                        <li><a onclick='$(this).parent().fadeOut();
                        $(this).parent().next().fadeIn();
                        $(".moreVariationItems${indexer}").fadeIn("slow");'><g:message code="more"></g:message></a></li>
                        <li class="moreItems"><a onclick='$(this).parent().fadeOut();
                        $(this).parent().prev().fadeIn();
                        $(".moreVariationItems${indexer}").fadeOut("fast");'><g:message code="less"></g:message></a>
                        </li>
                    </g:if>

                </g:if>
            </g:each>
            <li class="divider"></li>
        </g:if>
    </g:if>
</ul>