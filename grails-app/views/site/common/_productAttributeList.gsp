%{--Attribute Filters--}%
<div class="attribute-container">
<g:each in="${filters.attributes}" var="attribute">
    <h3 class="attribute-container-title">${attribute.value.name}</h3>
    <ul class="nav nav-list value-list">
        <g:each in="${attribute.value.countsByValue}" var="attributeValueCount">
            <g:if test="${productType}">
                <li class="checkable">
                    <eshop:filterStart productType="${productType}" attribute="${attribute.key}"
                                       value="${attributeValueCount._id}" type="icon"></eshop:filterStart>
                </li>
            </g:if>
            <g:else>
                <li class="checkable ${filters.selecteds[attribute.key]?.contains(attributeValueCount._id) ? 'active' : ''}">
                    <eshop:filterAddAttribute id="${attribute.key}"
                                              value="${attributeValueCount._id}" f="${params.f}"
                                              remove="${filters.selecteds[attribute.key]?.contains(attributeValueCount._id).toString()}"></eshop:filterAddAttribute>
                </li>
            </g:else>
        </g:each>
    </ul>
    <hr/>
</g:each>
</div>