%{--<div id="navigator_root">--}%
%{--<a href="${createLink(uri: '/')}site/browse/${message(code: "applicances")}" id="navigator_appliance"><g:message--}%
%{--code="applicances"></g:message></a>--}%
%{--<a href="${createLink(uri: '/')}site/browse/${message(code: "digital")}" id="navigator_digital"><g:message--}%
%{--code="digital"></g:message></a>--}%
%{--</div>--}%
<ul class="nav nav-list">
    <g:if test="${productType.children}">
        <li class="nav-header"><g:message code="site.selectSubcategory"
                                          default="Select SubProductType"></g:message></li>
    </g:if>
    <g:each in="${subProductTypeLinks}" var="subProductTypeLink">
        <li><a href="${subProductTypeLink.href}">${subProductTypeLink.name}</a></li>
    </g:each>
    <li class="divider"></li>

%{--Brands Filters--}%
    <g:if test="${filters?.brands}">
        <li class="nav-header sidebarBrandGroup"><g:message code="site.selectBrand"
                                                            default="Select Brand"></g:message></li>

        <g:each in="${filters.brands?.count { it } > 5 ? filters.brands?.sort { -it.count }[0..4] : filters.brands?.sort { -it.count }}"
                var="brand">
            <li class="checkable">
                <eshop:filterStartBrand productType="${productType}" brandId="${brand._id?.id}"
                                        brandName="${brand._id?.name}"></eshop:filterStartBrand>
            </li>
        </g:each>

        <g:if test="${filters.brands?.count { it } > 5}">
            <g:each in="${filters.brands?.sort { -it.count }[5..(filters.brands.count { it } - 1)]}" var="brand">
                <li class="checkable moreItems moreBrandItems">
                    <eshop:filterStartBrand productType="${productType}" brandId="${brand._id?.id}"
                                            brandName="${brand._id?.name}"></eshop:filterStartBrand>
                </li>
            </g:each>

            <li><a onclick="$(this).parent().fadeOut();$(this).parent().next().fadeIn();$(this).parent().next().fadeIn();$('.moreBrandItems').fadeIn('slow');"><g:message code="more"></g:message></a></li>
            <li class="moreItems"><a onclick="$(this).parent().fadeOut();$(this).parent().prev().fadeIn();$('.moreBrandItems').fadeOut('fast');"><g:message code="less"></g:message></a></li>
        </g:if>

        <li class="divider"></li>
    </g:if>

%{--Attribute Filters--}%
    <g:if test="${filters?.attributes}">
        <g:each in="${filters.attributes}" var="attribute" status="indexer">
            <li class="nav-header sidebarAttributeGroup">${attribute.value.name}</li>
            <g:each in="${attribute.value.countsByValue.count { it } > 5 ? attribute.value.countsByValue.sort{-it.count}[0..4] : attribute.value.countsByValue.sort{-it.count}}"
                    var="attributeValueCount">
                <li class="checkable">
                    <eshop:filterStart productType="${productType}" attribute="${attribute.key}"
                                       value="${attributeValueCount._id}"></eshop:filterStart>
                </li>
            </g:each>


            <g:if test="${attribute.value.countsByValue.count { it } > 5}">
                <g:each in="${attribute.value.countsByValue.sort { -it.count }[5..(attribute.value.countsByValue.count { it } - 1)]}" var="attributeValueCount">
                    <li class="checkable moreItems moreAttributeItems${indexer}">
                        <eshop:filterStart productType="${productType}" attribute="${attribute.key}"
                                           value="${attributeValueCount._id}"></eshop:filterStart>
                    </li>
                </g:each>

                <li><a onclick='$(this).parent().fadeOut();$(this).parent().next().fadeIn();$(".moreAttributeItems${indexer}").fadeIn("slow");'><g:message code="more"></g:message></a></li>
                <li class="moreItems"><a onclick='$(this).parent().fadeOut();$(this).parent().prev().fadeIn();$(".moreAttributeItems${indexer}").fadeOut("fast");'><g:message code="less"></g:message></a></li>
            </g:if>
        </g:each>
        <li class="divider"></li>
    </g:if>
</ul>