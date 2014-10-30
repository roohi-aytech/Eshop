<%@ page import="grails.converters.JSON; eshop.MenuConfig; eshop.ProductType" %>
<% def productService = grailsApplication.classLoader.loadClass('eshop.ProductService').newInstance() %>
<g:set var="rootProductTypes" value="${productService.findRootProductTypes()}"/>
<div class="department-head">
    <h1 id="departments"><span class="red"><g:message code="category"/></span> <g:message code="products"/></h1>
</div>

<div class="department_holder">
    <ul>
        <g:each in="${rootProductTypes}" var="productType">

            <li onclick="window.open('${createLink(uri: "/browse/${productType.urlName}")}', '_self')">
                <div class="cat_img">
                    <img src="${createLink(controller: 'image', params: [id:productType.id, type:'productType', wh:'150x150'])}" alt="${productType.name}" height="50" width="60"/>
                </div>

                <div class="cat_details">
                    <h2>${productType.name}</h2>

                    <p>${productType.description}</p>
                </div>

                <div class="clear" style="height: 1px;">&nbsp;</div>
            </li>
        </g:each>
    </ul>

    <div class="clear" style="height: 1px;">&nbsp;</div>
</div>

<script language="javascript" type="text/javascript">
    $(document).ready(function(){

        //dotdotdot
        $('.department_holder .cat_details p').dotdotdot({
            ellipsis: '... ',
            wrap: 'word',
            fallbackToLetter: true,
            after: null,
            watch: false,
            height: 35,
            tolerance: 0,
            callback: function (isTruncated, orgContent) {
            },
            lastCharacter: {
                remove: [ ' ', ',', ';', '.', '!', '?' ],
                noEllipsis: []
            }
        });
    });
</script>