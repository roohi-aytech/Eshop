<form id="price-filter" method="get" name="price-filter">
    <input type="text" placeholder="${message(code: 'minPrice')}" id="min-range" class="min-range right numb3rs"
           onkeyup="formatPrice(this)"/>

    <h3 class="right"><g:message code="filter.price.range.last"/></h3>
    <input type="text" placeholder="${message(code: 'maxPrice')}" id="max-range" class="max-range right numb3rs"
           onkeyup="formatPrice(this)"/>
    <input type="submit" disabled="disabled" class="filter-btn right" value="${message(code: 'priceFilter.apply')}"
           id="submit-price" onclick="filterByPrice();"/>
</form>

<script language="JavaScript" type="text/javascript">
    function filterByPrice() {
        var priceFilterFrom = $('#min-range').val().replace(/,/g, '');
        var priceFilterTo = $('#max-range').val().replace(/,/g, '');
        <g:if test="${params.action == 'browse'}">
        var params_f = 'p${productType.id}';
        var url = '${createLink(controller: 'site', action: 'filter')}';
        url += '?f=' + params_f;
        if (priceFilterFrom)
            url += ',rf' + priceFilterFrom;
        if (priceFilterTo)
            url += ',rt' + priceFilterTo;
        url += '&o=r'
        </g:if>
        <g:else>
        var params_f = '${params.f.replace(',' + params.f?.split(',')?.find {it?.toString()?.startsWith('rf')}, '').replace(',' + params.f?.split(',')?.find {it?.toString()?.startsWith('rt')}, '')}';
        <g:if test="${params.action == 'filter'}">
        var url = '${createLink(controller: 'site', action: 'filter')}';
        url += '?f=' + params_f;
        if (priceFilterFrom)
            url += ',rf' + priceFilterFrom;
        if (priceFilterTo)
            url += ',rt' + priceFilterTo;
        url += '&o=r'
        </g:if>
        <g:if test="${params.action == 'search'}">
        var url = '${createLink(controller: 'site', action: 'search', params: [phrase:params.phrase])}';
        url += '&f=' + params_f;
        if (priceFilterFrom)
            url += ',rf' + priceFilterFrom;
        if (priceFilterTo)
            url += ',rt' + priceFilterTo;
        url += '&o=r'
        </g:if>
        </g:else>
        window.location.href = url;
    }

    function formatPrice(item) {
        $(item).val(addCommasOnKeyPress($(item).val()));
    }

    function addCommasOnKeyPress(nStr) {
        nStr = nStr.replace(/\,/g, '');
        nStr += '';
        var x = nStr.split('.');
        var x1 = x[0];
        var x2 = x.length > 1 ? '.' + x[1] : '';
        var rgx = /(\d+)(\d{3})/;
        while (rgx.test(x1)) {
            x1 = x1.replace(rgx, '$1' + ',' + '$2');
        }
        return x1 + x2;
    }

    $(".priceRange").keydown(function (e) {
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
                (e.keyCode == 65 && e.ctrlKey === true) ||
                (e.keyCode >= 35 && e.keyCode <= 39)) {
            return;
        }
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    });

    $('#min-range').val(addCommasOnKeyPress('${(params.f?.split(',')?.find {
        it?.toString()?.startsWith('rf')
    }?.replace('rf', '') ?: filters?.priceRange? filters?.priceRange?.min : 0) as Integer}'));
    $('#max-range').val(addCommasOnKeyPress('${(params.f?.split(',')?.find {
        it?.toString()?.startsWith('rt')
    }?.replace('rt', '') ?: filters?.priceRange? filters?.priceRange?.max : 1000000000) as Integer}'));
</script>