<div class="department-head">
    <h1 class="pad_b0"><g:message code="similarItems"/></h1>
</div>

<div>
    <a href="${createLink(uri: "/filter?f=p${product.productTypes?.toArray()?.last()?.id},b${product.brand?.id}&o=b")}">
        <div class="acnt-btn mtop0">
            <h3><g:message code="moreItemsFrom" args="${[product.productTypes?.toArray()?.last()]}"/> <span
                    class="black"><strong>${product.brand}</strong></span></h3>
        </div>
    </a>
</div>
<a href="${createLink(uri: "/browse/${product.productTypes?.toArray()?.last()?.seoFriendlyName}")}"><div
        class="back-btn"><h3><g:message code="moreCategoryItems"
                                        args="${[product.productTypes?.toArray()?.last()]}"/></h3></div></a>