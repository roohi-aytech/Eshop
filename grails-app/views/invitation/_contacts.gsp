<div id="filter"><g:message code="grails.plugin.invitation.contacts.search"/><g:textField name="filterField" id="filterField" value=""></g:textField>
    <div id="selectionHelpers">
      <a id="selectAll" href="javascript:void(0);"><g:message code="grails.plugin.invitation.contacts.selectAll"/></a> |
      <a id="clearSelection" href="javascript:void(0);"><g:message code="grails.plugin.invitation.contacts.clearSelection"/></a>
    </div>
</div>

<div id="invitation-friends" class="friends">
    <g:each in="${ contacts }" var="contact">
        <div class="friend" data-email="${contact.address}">
            <g:if test="${contact.photo}">
                <img src="${contact.photo}"/>
            </g:if><g:else>
                <img src="${resource(dir: 'images', file: 'empty.png')}"/>
            </g:else>
            <span>${contact.name ? contact.name : contact.address}</span>
        </div>
    </g:each>
</div>