
<g:javascript src="${resource(dir:"js", file:"jquery.mousewheel.js")}"></g:javascript>
<g:javascript src="${resource(dir:"js", file:"jcarousellite.js")}"></g:javascript>

<% def productService = grailsApplication.classLoader.loadClass('eshop.ProductService').newInstance() %>
<g:set var="productList" value="${productService.findMostVisitedProducts()}"></g:set>

<div dir="ltr">

    <div id="jCarouselLite">
        <ul>
            <g:each in="${productList}" var="product">
                <g:render template="product_carousel" model="${[product: product]}"></g:render>
            </g:each>
        </ul>
    </div>
    <button id="prev">prev</button>
    <button id="next">next</button>
</div>

<g:javascript>
//    $(document).ready(function () {
//        $('.carouselItem').width(($('#jCarouselLite').width() / 5) + "px");
//        $("#jCarouselLite").jCarouselLite({
//            btnNext: "#next",
//            btnPrev: "#prev"
//        })
//    });
</g:javascript>