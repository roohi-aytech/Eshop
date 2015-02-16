<g:if test="${filters?.priceRange != 0}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'jquery.slider.css')}"/>
    <script type="text/javascript" language="JavaScript"
            src="${resource(dir: 'js', file: 'jquery.slider.js')}"></script>

    <div class="rangeSliderContainer" style="direction: ltr">
        <span class="title"><g:message code="priceRangeSlider.title"/></span>
        <span class="rangeSlider">
            <input id="priceRangeSlider" type="slider"
                   name="price"
                   value="${params.f?.split(',')?.find {
                       it?.toString()?.startsWith('rf')
                   }?.replace('rf', '') ?: filters?.priceRange?.min ?: 0};${params.f?.split(',')?.find {
                       it?.toString()?.startsWith('rt')
                   }?.replace('rt', '') ?: filters?.priceRange?.max ?: 1000000000}"/>
        </span>
        <g:if test="${!grailsApplication.config.filterPriceOnChange}">
            <input type="button" class="btn btn-danger" onclick="filterByPrice();"/>
        </g:if>
    </div>
    <script type="text/javascript" charset="utf-8">
        jQuery("#priceRangeSlider").slider({
            from: ${filters?.priceRange?.min?:0},
            to: ${filters?.priceRange?.max?:1000000000},
            step: 1000,
            smooth: true,
            round: 0,
            dimension: "&nbsp;${eshop.currencyLabel()}",
            <g:if test="${grailsApplication.config.filterPriceOnChange}">
            callback: function (event, ui) {
                filterByPrice();
            },
            </g:if>
            skin: "red"
        });

        function filterByPrice() {
            var priceRange = $('#priceRangeSlider').val().split(';');
            <g:if test="${params.action == 'browse'}">
            var params_f = 'p${productType.id}';
            var url = '${createLink(controller: 'site', action: 'filter')}';
            url += '?f=' + params_f;
            if (priceRange[0])
                url += ',rf' + priceRange[0];
            if (priceRange[1])
                url += ',rt' + priceRange[1];
            </g:if>
            <g:else>
            var params_f = '${params.f.replace(',' + params.f?.split(',')?.find {it?.toString()?.startsWith('rf')}, '').replace(',' + params.f?.split(',')?.find {it?.toString()?.startsWith('rt')}, '')}';
            <g:if test="${params.action == 'filter' || params.action == 'ajaxFilter'}">
            var url = '${createLink(controller: 'site', action: 'filter')}';
            url += '?f=' + params_f;
            if (priceRange[0])
                url += ',rf' + priceRange[0];
            if (priceRange[1])
                url += ',rt' + priceRange[1];
            <g:if test="${params.sort}">
            url += '&sort=${params.sort}';
            </g:if>
            <g:if test="${params.dir}">
            url += '&dir=${params.dir}';
            </g:if>
            </g:if>
            <g:if test="${params.action == 'search' || params.action == 'ajaxSearch'}">
            var url = '${createLink(controller: 'site', action: 'search', params: [phrase:params.phrase, sort: params.sort?:'default',dir:params.dir?:-1])}';
            url += '&f=' + params_f;
            if (priceRange[0])
                url += ',rf' + priceRange[0];
            if (priceRange[1])
                url += ',rt' + priceRange[1];
            </g:if>
            </g:else>

            <g:if test="${grailsApplication.config.ajaxFilter}">
            var ajaxUrl = url.replace('/filter?', '/ajaxFilter?');
            ajaxUrl = ajaxUrl.replace('/search?', '/ajaxSearch?');

            ajaxFilter(ajaxUrl);
            </g:if>
            <g:else>
            window.location.href = url;
            </g:else>
        }
    </script>
</g:if>