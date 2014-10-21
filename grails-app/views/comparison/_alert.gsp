<div><g:message code="alerts.compare.newItem" args="${[name]}"/></div>
<br/>

<div><g:message code="alerts.compare.items.title"/>:</div>
<ul class="alert-compare-items">
    <g:each in="${map}" var="item">
        <li>${item.value} <g:message code="alerts.compare.items.item"/> ${item.key}</li>
    </g:each>
</ul>
<g:if test="${enabled}">
    <br/>
    <div>
        <g:message code="alerts.compare.items.question"/>
        <g:link class="btn" controller="comparison" action="show"><g:message
                code="yes"/></g:link>
        <span class="btn" onclick="$('#link-compare').qtip('hide');"><g:message
                code="no"/></span>
    </div>
</g:if>
<g:else>
    <script type="text/javascript" language="javascript">
        setTimeout(function(){$('#link-compare').qtip('hide');}, 5000);
    </script>
</g:else>