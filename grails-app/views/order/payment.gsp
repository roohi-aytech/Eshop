<%--
  Created by IntelliJ IDEA.
  User: Farzin
  Date: 4/11/13
  Time: 8:45 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="site"/>
    <title></title>
    <g:if test="${params.bank}">
        <g:if test="${params.bank == 'mellat'}">
            <script language="javascript" type="text/javascript">
                function postRefId(refIdValue) {
                    var form = document.createElement("form");
                    form.setAttribute("method", "POST");
                    form.setAttribute("action", "<%= PgwSite %>");
                    form.setAttribute("target", "_self");
                    var hiddenField = document.createElement("input");
                    hiddenField.setAttribute("name", "RefId");
                    hiddenField.setAttribute("value", refIdValue);
                    form.appendChild(hiddenField);
                    document.body.appendChild(form);
                    form.submit();
                    document.body.removeChild(form);
                }
            </script>
        </g:if>
    </g:if>
    <g:else>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.msdropdown.css')}"/>
        <g:javascript src="jquery.msdropdown.js"></g:javascript>
    </g:else>
</head>

<body>
<div class="control-panel">
    <g:if test="${params.bank}">
        <g:if test="${params.bank == 'mellat'}">
            <h2><g:message code="order.payment.mellat.title"></g:message></h2>

            <div class="info">
                <div><g:message code="order.payment.mellat.waitingMessage"></g:message></div>
            </div>
        </g:if>
        <g:if test="${params.bank == 'pasargad'}">
            <h3><g:message code="underConstruction"></g:message></h3>
        </g:if>
    </g:if>
    <g:else>
        <h2><g:message code="controlPanel.orders.actions.payment.label"></g:message></h2>

        <g:message
                code="order.payment.bankSelect.description"></g:message><br/><br/>

        <select name="webmenu" id="webmenu" onchange="selectBank(this.value)">
            <option value="mellat"
                    data-image="${resource(dir: 'images', file: 'bank-mellat.png')}">${message(code: "order.payment.bank.mellat.label")}</option>
            <option value="pasargad"
                    data-image="${resource(dir: 'images', file: 'bank-passargad.png')}">${message(code: "order.payment.bank.pasargad.label")}</option>
        </select>
        <g:javascript>

            function selectBank(value){
                window.location.href = "${createLink(controller: 'order', action: 'payment', params: [id: params.id])}" + "?bank=" + value;
            }

            $(document).ready(function (e) {
                try {
                    $("body select").msDropDown();
                } catch (e) {
                    alert(e.message);
                }
            });
        </g:javascript>
    </g:else>
</div>
</body>
</html>