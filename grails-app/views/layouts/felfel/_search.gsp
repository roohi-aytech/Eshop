<%@ page import="grails.converters.JSON; eshop.ProductType" %>
<% def productService = grailsApplication.classLoader.loadClass('eshop.ProductService').newInstance() %>
<g:set var="rootProductTypes" value="${productService.findRootProductTypes()}"/>
<div class="search_recommendation">
    <g:message code="search.sample.title"/> :
    <a href="${createLink(uri: "/search?f=p0&phrase=${message(code:'search.sample.1')}")}"><g:message code="search.sample.1"/></a>
    ,
    <a href="${createLink(uri: "/search?f=p0&phrase=${message(code:'search.sample.2')}")}"><g:message code="search.sample.2"/></a>
    ,
    <a href="${createLink(uri: "/search?f=p0&phrase=${message(code:'search.sample.3')}")}"><g:message code="search.sample.3"/></a>
</div>

<div class="search_bar">
    <g:form url="${createLink(uri: '/search')}" method="get" id="searchForm">
        <g:submitButton name="s" value="" class="submit"
                        onclick="return \$('searchPhrase').val() != '';"/>
        <div class="btn-group pull-left">
            <a class="btn btn-inverse-grey dropdown-toggle" data-toggle="dropdown" href="#">
                <span id="searchCategory">
                    ${params.category && params.category != "0" ? ProductType.get(params.category)?.name : productTypeId ? productTypeName.toString() : message(code: 'category.all')}
                </span>
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <li>
                    <a tabindex="-1"
                       href="#"
                       onclick="$('#hidCategory').val('p0');
                       $('#searchCategory').html('${message(code: 'category.all')}')">${message(code: 'category.all')}</a>
                </li>
                <g:each in="${rootProductTypes}" var="rootProductType">
                    <li class="dropdown-submenu">
                        <a tabindex="-1"
                           href="#"
                           onclick="$('#hidCategory').val('p${rootProductType.id}');
                           $('#searchCategory').html('${rootProductType.name}')">${rootProductType.name}</a>
                        <ul class="dropdown-menu">
                            <g:each in="${rootProductType.children}" var="pt">
                                <g:render
                                        template="/layouts/${grailsApplication.config.eShop.instance}/dropdown_productType"
                                        model="${[productType: pt]}"/>
                            </g:each>
                        </ul>
                    </li>
                </g:each>
            </ul>
        </div>
        <g:hiddenField name="f" id="hidCategory" value="p${productTypeId ? productTypeId.toString() : '0'}"/>
        <g:if test="${params.f}">
            <g:hiddenField name="f" id="hidFilter" value="${params.f?.toString()?.split(',')?.findAll{!it.toString().startsWith('p')}?.join(',')}"/>
        </g:if>
        <input name="phrase" id="searchPhrase" type="text" class="srch_input"
               autocomplete="off"
               value="${params.phrase ? params.phrase : ''}"
               placeholder="<g:message code="search"/>">
    </g:form>
</div>