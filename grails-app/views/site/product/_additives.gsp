<g:if test="${addedValues?.size() > 0}">
    <div class="addedValues">
        <div class="title"><g:message code="addedValue.title"/></div>
        <g:each in="${addedValues}" var="addedValue">
            <div class="item"
                ${addedValue.processTime == 'mandetory' ? 'original-title="' + message(code: "product.addedValues.${addedValue.processTime}.tip") + '"' : ''}>
                <div>
                    %{--<g:if test="${addedValue.processTime == 'optional'}">--}%
                    <input type="checkbox" name="addedValues"
                           id="addedValues_${addedValue.id}" ${addedValue.processTime == 'mandetory' ? 'disabled' : ''}
                           value="${addedValue.id}" onchange="addOrRemoveAddedValue(this);"
                        ${selectedAddedValues.collect { it.id }.contains(addedValue.id) ? 'checked' : ''}/>
                    <label for="addedValues_${addedValue.id}">
                        ${addedValue.name}
                    </label>
                </div>

                <div class="price">
                    <g:if test="${addedValue.value != 0}">
                        <g:if test="${addedValue.type == 'percent'}">
                            <g:formatNumber number="${Math.round((addedValue.value * price.showVal) / 100)}"
                                            type="number"/> <g:message code="rial"/>
                        </g:if>
                        <g:else>
                            <g:formatNumber number="${addedValue.value}" type="number"/> <g:message code="rial"/>
                        </g:else>
                    </g:if>
                    <g:else>
                        <g:message code="free"/>
                    </g:else>
                </div>
            </div>
        </g:each>
    </div>
</g:if>