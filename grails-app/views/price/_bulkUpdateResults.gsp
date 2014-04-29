<g:if test="${showResult}">
    <h3><g:message code="price.bulkUpdate.excel.import.result"/></h3>
    <table class="import-report">
        <tr>
            <th><g:message code="price.bulkUpdate.excel.import.result.id"/></th>
            <th><g:message code="price.bulkUpdate.excel.import.result.name"/></th>
            <th><g:message code="price.bulkUpdate.excel.import.result.statusChanged"/></th>
            <th><g:message code="price.bulkUpdate.excel.import.result.priceChanged"/></th>
            <th><g:message code="price.bulkUpdate.excel.import.result.errorList"/></th>
        </tr>
        <g:each in="${priceList}" var="item" status="i">
            <tr class="${i % 2 == 0 ? 'even' : 'odd'} ${item.hasError ? 'error' : ''}  ${item.statusChanged || item.priceChanged ? 'edited' : ''}">
                <td>${item.id}</td>
                <td>${item.name}</td>
                <td>
                    <g:if test="${item.statusChanged}">
                        <g:message code="productModel.status.${item.oldStatus}"/> -> <g:message code="productModel.status.${item.status}"/>
                    </g:if>
                </td>
                <td>
                    <g:if test="${item.priceChanged}">
                        <g:formatNumber type="number" number="${item.oldPrice}"/> -> <g:formatNumber type="number" number="${item.price}"/>
                    </g:if>
                </td>
                <td><b>${item.errorList.collect{message(code:"price.bulkUpdate.excel.import.result.error.${it}")}.join('<br/>')}</b></td>
            </tr>
        </g:each>
    </table>
</g:if>