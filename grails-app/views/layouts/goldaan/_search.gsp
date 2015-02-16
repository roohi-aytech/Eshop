<%@ page import="eshop.ProductType" %>
<% def productService = grailsApplication.classLoader.loadClass('eshop.ProductService').newInstance() %>
<g:set var="rootProductTypes" value="${productService.findRootProductTypes()}"/>

<div class="search-box">
    <g:form url="${createLink(uri: '/search')}" method="get" id="searchForm">
        <g:hiddenField name="f" id="hidCategory" value="p${productTypeId ? productTypeId.toString() : '0'}"/>
        <g:if test="${params.f}">
            <g:hiddenField name="f" id="hidFilter" value="${params.f?.toString()?.split(',')?.findAll{!it.toString().startsWith('p')}?.join(',')}"/>
        </g:if>
        <table class="table-simulated">
            <tr class="table-row">
                <td class="navbar-search pull-right table-cell search-input-box">

                    <input name="phrase" id="searchPhrase" type="text" class="input-large search-query"
                           autocomplete="off"
                           value="${params.phrase ? params.phrase : ''}"
                           placeholder="<g:message code="search"/>">
                </td>

                <td id="btn-search" class="table-cell">
                    <g:submitButton name="s" value=""
                                    onclick="\$(this).attr('disabled', true);return \$('searchPhrase').val() != '';"/>
                </td>
            </tr>
        </table>
    </g:form>
</div>