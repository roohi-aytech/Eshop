<%@ page import="eshop.Producer;" %>
<!doctype html>
<html>
<head>
    <r:require modules="bootstrap-file-upload"/>
    <meta name="layout" content="main">
    <title>${producerInstance}</title>

</head>

<body>
<h2><g:message code="producer.details.label" default="Producer Details"/> ${producerInstance}</h2>

<div id="details-tabs">
    <ul>
        <li><a href="#producingProducts"><g:message code="producingProducts"/></a></li>
        <li><a href="#producerStaffs"><g:message code="producerStaff"/></a></li>
        <li><a href="#producerAccounts"><g:message code="producerAccount"/></a></li>

    </ul>

    <div id="producingProducts" style="width: 98%">
        <g:render template="../producingProduct/list"/>
    </div>

    <div id="producerStaffs">
        <g:render template="producerStaffs"/>
    </div>

    <div id="producerAccounts">
        <g:render template="producerAccounts"/>
    </div>

</div>
<g:javascript>
    $(function() {
        $( "#details-tabs" ).tabs({
            selected:${curtab ?: 0}
    ${producerInstance.id ? "" : ",disabled:[2]"}
    });
    });
</g:javascript>

</body>
</html>