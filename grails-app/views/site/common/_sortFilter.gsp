
<select id="sortField" class="sortFilterSelect" data-width="138px">
    <option value="default" ${params.sort == 'default' ? 'selected' : ''}><g:message code="sort.default"/></option>
    <option value="modelId" ${params.sort == 'modelId' ? 'selected' : ''}><g:message code="sort.new"/></option>
    <option value="customerRate" ${params.sort == 'customerRate' ? 'selected' : ''}><g:message code="sort.rate"/></option>
    <option value="visitCount" ${params.sort == 'visitCount' ? 'selected' : ''}><g:message code="sort.visit"/></option>
    <option value="saleCount" ${params.sort == 'saleCount' ? 'selected' : ''}><g:message code="sort.sale"/></option>
    <option value="priceChangeDate" ${params.sort == 'priceChangeDate' ? 'selected' : ''}><g:message code="sort.priceDate"/></option>
    <option value="priceChange" ${params.sort == 'priceChange' ? 'selected' : ''}><g:message code="sort.priceDecrease"/></option>
    <option value="price" ${params.sort == 'price' ? 'selected' : ''}><g:message code="sort.price"/></option>
</select>
<select id="sortDirection" class="sortFilterSelect" data-width="90px">
    <option value="-1" ${params.dir == '-1' ? 'selected' : ''}><g:message code="sort.descending"/></option>
    <option value="1" ${params.dir == '1' ? 'selected' : ''}><g:message code="sort.ascending"/></option>
</select>

<script language="javascript" type="text/javascript">
    $(document).ready(function () {

        var url;
        <g:if test="${actionName == 'browse'}">
            url = '${createLink(action: 'filter', params: [f: "p${productType.id}", sort: 'sortField', dir: 'sortDirection', o: 's'])}';
        </g:if>
        <g:if test="${actionName == 'filter'}">
        url = '${createLink(action: 'filter', params: [f: params.f, sort: 'sortField', dir: 'sortDirection', o: 's'])}';
        </g:if>
        <g:if test="${actionName == 'search'}">
        url = '${createLink(action: 'search', params: [f: params.f, phrase: params.phrase, sort: 'sortField', dir: 'sortDirection', o: 's'])}';
        </g:if>
        try {
            $('.sortFilterSelect').selectpicker();
        }catch (x){
            console.log(x);
        }
        $('.sortFilterSelect').change(function(){
            window.location.href = url.replace('sortField', $('#sortField').val()).replace('sortDirection', $('#sortDirection').val())
        })

    });
</script>