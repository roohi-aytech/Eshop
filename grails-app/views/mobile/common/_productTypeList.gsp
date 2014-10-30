<g:if test="${productType.children}">
    <ul class="links">
        <g:each in="${subProductTypeLinks}" var="subProductTypeLink">
            <a href="${subProductTypeLink.href}"><li>${subProductTypeLink.name}</li></a>
        </g:each>
    </ul>
</g:if>