<g:if test="${specialSaleSlides && !specialSaleSlides?.isEmpty()}">
    <h3 class="category_heading spicy_offer_heading">
        <g:message code="specialSale.title"/>
    </h3>

    <g:each in="${specialSaleSlides.size() % 4 != 0 ? specialSaleSlides[(specialSaleSlides.size() % 4)..(specialSaleSlides.size() - 1)] : specialSaleSlides}" status="i" var="slide">
        <g:if test="${i % 4 == 0}">
            <div class="row spicy_offers">
        </g:if>
        <g:render template="/site/${grailsApplication.config.eShop.instance}/templates/specialSalesThumbnail"
                  model="[slide: slide]"/>
        <g:if test="${i % 4 == 3 || i == specialSaleSlides.size() - 1}">
            </div>
        </g:if>
    </g:each>
</g:if>