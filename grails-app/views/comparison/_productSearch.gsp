<g:form url="${createLink(uri: '/search')}" class="comparison-search-form" method="get" id="comparisonSearchForm${productType.id}">
    <g:hiddenField name="f" id="hidCategory" value="p${productType.id}"/>
    <table class="table-simulated">
        <tr class="table-row">

            <td class="navbar-search pull-right table-cell search-input-box">
                <input name="phrase" id="searchPhrase" type="text" class="comparison-search-query" autocomplete="off"
                       value="" placeholder="<g:message code="search"/>">
            </td>
        </tr>
    </table>
</g:form>
<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $("#comparisonSearchForm${productType.id}").attr('searchAutoCompleteUrl', '${createLink(controller: 'comparison', action: 'searchAutoComplete', params: [id:productType.id])}');
        setupSearchAutoComplete($("#comparisonSearchForm${productType.id}"))
    });
</script>