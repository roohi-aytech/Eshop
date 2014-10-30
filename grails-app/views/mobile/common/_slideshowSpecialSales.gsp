<g:if test="${specialSaleSlides && !specialSaleSlides?.isEmpty()}">
    <div class="department-head">
        <h1><span class="red"><g:message code="suggestion"/></span> <g:message code="special"/></h1>
    </div>

    <g:each in="${specialSaleSlides}" status="i" var="slide">
        <div onclick="window.open('${createLink(controller: 'site', action: 'product', params: [id: slide.product.id])}', '_self')"
             class="deal_ofthe_day">
            <div class="deal_img"><img width="131" height="131" title="${slide.product}"
                                       alt="${slide.product}"
                                       src="${createLink(controller: "image", action: "index")}/${slide.id}?type=specialSale"></div>

            <div class="deal_details">
                <h3>${slide.product}</h3>

                <p><span class="strike_through"><eshop:thumbnailOldPrice productId="${slide.product.id}"/></span> <span class="red"><eshop:thumbnailPrice productId="${slide.product.id}" hideLastUpdate="true"/></span></p>

                %{--<p>Save Rs. 1,324 Today</p>--}%
            </div>

            <div style="height: 1px;" class="clear">&nbsp;</div>
        </div>
        <p></p>
    </g:each>
</g:if>


