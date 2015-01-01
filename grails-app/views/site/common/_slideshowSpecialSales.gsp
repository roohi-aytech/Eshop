<g:if test="${specialSaleSlides && !specialSaleSlides?.isEmpty()}">
    <link href="${resource(dir: 'css', file: 'jquery.jcountdown.css')}" rel="stylesheet" type="text/css"/>
    <script language="javascript" src="${resource(dir: 'js', file: 'jquery.jcountdown.js')}" type="text/javascript"></script>

    <link href="${resource(dir: 'css', file: 'responsive.specialSaleSlider.css')}" rel="stylesheet" type="text/css"/>

    <ul class="responsive-specialSalesSlider" height="180">
        <g:each in="${specialSaleSlides}" var="slide">
            <li>
                <a href="${createLink(controller: 'site', action: 'product', params: [id: slide.product.id])}"
                   href-extra1="${slide.extraLink1 ?: createLink(controller: 'site', action: 'product', params: [id: slide.product.id])}"
                   href-extra2="${slide.extraLink2 ?: createLink(controller: 'site', action: 'product', params: [id: slide.product.id])}"
                   href-extra3="${slide.extraLink3 ?: createLink(controller: 'site', action: 'product', params: [id: slide.product.id])}">
                    <img alt="${slide.product.name?:""}"
                        <g:if test="${slide.finishDate}">
                            finishDate="${formatDate(date: slide.finishDate, format: 'yyyy/MM/dd HH:mm:ss', timeZone: 'utc')}"
                        </g:if>
                        src="${createLink(controller: "image", action: "index")}/${slide.id}?type=specialSale"
                        src-extra1="${createLink(controller: "image", action: "index")}/${slide.id}?type=specialSale&role=e1"
                        src-extra2="${createLink(controller: "image", action: "index")}/${slide.id}?type=specialSale&role=e2"
                        src-extra3="${createLink(controller: "image", action: "index")}/${slide.id}?type=specialSale&role=e3"/>
                </a>
            </li>
        </g:each>
    </ul>

    <script language="javascript" src="${resource(dir: 'js', file: 'responsive.specialSaleSlider.js')}"
            type="text/javascript"></script>

</g:if>