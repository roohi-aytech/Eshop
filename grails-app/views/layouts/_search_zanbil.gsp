<%@ page import="eshop.ProductType" %>
<% def productService = grailsApplication.classLoader.loadClass('eshop.ProductService').newInstance() %>
<g:set var="rootProductTypes" value="${productService.findRootProductTypes()}"/>

<div class="search-box">
    <g:form url="${createLink(uri: '/search')}" method="get" id="searchForm">
        <g:hiddenField name="f" id="hidCategory" value="p${productTypeId ? productTypeId.toString() : '0'}"/>
        <g:if test="${params.f}">
            <g:hiddenField name="f" id="hidFilter" value="${params.f}"/>
        </g:if>
        <table class="table-simulated">
            <tr class="table-row">
                <td class="table-cell category-select">
                    <div class="btn-group pull-right">
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
                                   onclick="$('#hidCategory').val('p0');$('#searchCategory').html('${message(code: 'category.all')}')">${message(code: 'category.all')}</a>
                            </li>
                            <g:each in="${rootProductTypes}" var="rootProductType">
                                <li class="dropdown-submenu">
                                    <a tabindex="-1"
                                       href="#"
                                       onclick="$('#hidCategory').val('p${rootProductType.id}');$('#searchCategory').html('${rootProductType.name}')">${rootProductType.name}</a>
                                    <ul class="dropdown-menu">
                                        <g:each in="${rootProductType.children}" var="pt">
                                            <g:render template="/layouts/dropdown_productType_zanbil"
                                                      model="${[productType: pt]}"/>
                                        </g:each>
                                    </ul>
                                </li>
                            </g:each>
                        </ul>
                    </div>
                </td>
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