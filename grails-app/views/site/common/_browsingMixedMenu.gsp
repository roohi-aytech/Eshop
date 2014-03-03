<div class="clip_selection_block brands_collections_holder" style="margin-bottom:10px;">
    <div class="new_selection_holder">
        <div class="new_heading"><g:message code="menu.header.title"
                                            args="[productType.name, createLink(uri: '/browse/' + productType.seoFriendlyName)]"/></div>

        <div class="selection_col_left">
            <ul>
                <g:each in="${subProductTypeLinks.size() > 8 ? subProductTypeLinks[0..7] : subProductTypeLinks}"
                        var="productTypeLink" status="index">
                    <li class="${index % 4 == 3 ? 'last' : ''}">
                        <p class="sel_catimage">
                            <a href="${productTypeLink.href}">
                                <img width="118"
                                     height="118"
                                     alt="${productTypeLink.name}"
                                     src="${createLink(controller: 'image', params: [type: 'productType', id: productTypeLink.id, wh: '100x100'])}"
                                     title="${productTypeLink.name}">
                            </a>
                        </p>

                        <p class="sel_cattitle">
                            <a href="${productTypeLink.href}">${productTypeLink.name}</a>
                        </p>
                    </li>
                </g:each>
            </ul>
        </div>

        <div class="selection_col_middle">
            <h2 class="middle_heading"><g:message code="menu.otherTypes.title"/></h2>
            <ul>
                <g:each in="${subProductTypeLinks.size() > 8 ? (subProductTypeLinks.size() > 21 ? subProductTypeLinks[8..20] : subProductTypeLinks[8..(subProductTypeLinks.size() - 1)]) : []}"
                        var="productTypeLink">
                    <li><a href="${productTypeLink.href}" title="${productTypeLink.name}">${productTypeLink.name}</a>
                    </li>
                </g:each>
            </ul>
            <g:if test="${subProductTypeLinks.size() > 21}">
                <ul class="last">
                    <g:each in="${subProductTypeLinks.size() > 25 ? subProductTypeLinks[21..25] : subProductTypeLinks}">
                        <li><a href="${productTypeLink.href}" title="${productTypeLink.name}">${productTypeLink.name}</a>
                    </g:each>
                </li>
                    <li>&nbsp;</li>
                    <li><img width="140" height="140" alt=""
                             src="${createLink(controller: 'image', params: [id:productType.id, type:'productTypeMenu', role:'e4'])}"></li>
                </ul>
            </g:if>
            <g:else>
                <div class="selection_col_middle banners_only">
                    <ul class="last">
                        <li><img width="140" height="140" alt=""
                                 src="${createLink(controller: 'image', params: [id:productType.id, type:'productTypeMenu', role:'e4'])}"></li>
                        <li><img width="140" height="140" alt=""
                                 src="${createLink(controller: 'image', params: [id:productType.id, type:'productTypeMenu', role:'e5'])}">
                        </li>
                    </ul>
                </div>
            </g:else>
        </div>

        <div class="selection_col_right">
            <h2 class="middle_heading"><g:message code="menu.shopByBrand.title"/></h2>
            <ul>
                <g:each in="${filters.brands.size() > 14 ? filters.brands[0..13] : filters.brands}" var="brand">
                    <li>
                        <eshop:filterStartBrand productType="${productType}" brandId="${brand._id?.id}"
                                                brandName="${brand._id?.name}"/>
                    </li>
                </g:each>
            </ul>
        </div>

        <div style="clear: both;">&nbsp;</div>
    </div>
</div>
