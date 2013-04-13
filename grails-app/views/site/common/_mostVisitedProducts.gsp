<g:javascript src="jcarousellite.js"></g:javascript>

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
    $("#jCarouselLite").jCarouselLite({
        btnNext: "#next",
        btnPrev: "#prev"
    });
</g:javascript>