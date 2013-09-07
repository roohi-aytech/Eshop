<html>
<head>
    <meta name='layout' content='site'/>
    <title><g:message code="profile"/></title>

    <jqui:resources theme="cobalt"></jqui:resources>
    <link rel="stylesheet"
          href="${resource(dir: 'css/datepicker', file: 'ui.datepicker.css', plugin: 'rapid-grails')}"/>
    <g:javascript src="datepicker/jquery.ui.datepicker-cc.js" plugin="rapid-grails"/>
    <g:javascript src="datepicker/calendar.js" plugin="rapid-grails"/>
    <g:javascript src="datepicker/jquery.ui.datepicker-cc-fa.js" plugin="rapid-grails"/>
    <p:css name="jquery.easyui/metro/easyui"/>
    <p:css name="jquery.easyui/easyui-rtl"/>
    <p:javascript src="jquery.easyui/jquery.draggable"/>
    <p:javascript src="jquery.easyui/jquery.panel"/>
    <p:javascript src="jquery.easyui/jquery.parser"/>
    <p:javascript src="jquery.easyui/jquery.validatebox"/>
    <p:javascript src="jquery.easyui/jquery.tree"/>
    <p:javascript src="jquery.easyui/jquery.combo"/>
    <p:javascript src="jquery.easyui/jquery.combotree"/>

    <script language="javascript" type="text/javascript">
        var modal;
        function showCreatePersonalEventsModal() {
            $("#personalEventsModal .modal-body").html('<img style="margin:auto;padding:20px;" class="loading" src="${resource(dir: 'images', file: 'loading.gif')}"/>');
            modal = $("#personalEventsModal").modal({
                backdrop: false,
                show: true
            });
            $("#personalEventsModal .modal-body").load('${createLink(controller: 'personalEvent', action: 'create')}', function () {
            });
        }

        function showEditersonalEventsModal(id) {
            $("#personalEventsModal .modal-body").html('<img style="margin:auto;padding:20px;" class="loading" src="${resource(dir: 'images', file: 'loading.gif')}"/>');
            modal = $("#personalEventsModal").modal({
                backdrop: false,
                show: true
            });
            $("#personalEventsModal .modal-body").load('${createLink(controller: 'personalEvent', action: 'edit')}/' + id, function () {
            });
        }

        function hidePersonalEventsModal() {
            $('#priceHistogramModal').removeClass('in');
            modal.hide();
        }

        $('.action-btn').tipsy({live: true});
    </script>
</head>

<body>

<div class="control-panel">
    <h2><g:message
            code="controlPanel.settings.personalEvents.label"></g:message></h2>
    <table class="zebra table-simulated">
        <thead>
        <tr>
            <th style="width: 16px">&nbsp;</th>
            <th style="width: 16px">&nbsp;</th>
            <th><g:message code="personalEvent.title"/></th>
            <th><g:message code="personalEvent.fullName"/></th>
            <th><g:message code="personalEvent.relationship"/></th>
            <th><g:message code="personalEvent.sex"/></th>
            <th><g:message code="personalEvent.date"/></th>
            <th><g:message code="personalEvent.jobTitle"/></th>
            <th><g:message code="personalEvent.favoriteStyle"/></th>
            <th><g:message code="personalEvent.minPrice"/></th>
            <th><g:message code="personalEvent.maxPrice"/></th>

        </tr>
        </thead>
        <tfoot>
        <tr>
            <td>&nbsp;</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        </tfoot>
        <g:each in="${customerInstance.personalEvents.sort {it.id}}" var="personalEvent">
            <tr>
                <td><img class="action-btn" original-title="${message(code:'edit')}" style="cursor: pointer" onclick="showEditersonalEventsModal(${personalEvent.id});" src="${resource(dir: 'images', file: 'personal_event_edit.png')}"/></td>
                <td><a href="${createLink(controller: 'personalEvent', action: 'delete', params: [id:personalEvent.id])}"><img class="action-btn" original-title="${message(code:'delete')}" src="${resource(dir: 'images', file: 'personal_event_delete.png')}"/></a></td>
                <td>${personalEvent.title}</td>
                <td>${personalEvent.fullName}</td>
                <td>${personalEvent.relationship}</td>
                <td><g:message code="personalEvent.sex.${personalEvent.sex}"/></td>
                <td><rg:formatJalaliDate date="${personalEvent.date}"/></td>
                <td><g:message code="personalEvent.jobTitle.${personalEvent.jobTitle}"/></td>
                <td><g:message code="personalEvent.favoriteStyle.${personalEvent.favoriteStyle}"/></td>
                <td><g:formatNumber number="${personalEvent.minPrice}" type="number"/></td>
                <td><g:formatNumber number="${personalEvent.maxPrice}" type="number"/></td>
            </tr>
        </g:each>
    </table>

    <div class="btn-toolbar">
        <input class="btn btn-primary" onclick="showCreatePersonalEventsModal();" type="button"
               value="${message(code: "personalEvents.add.label")}"/>
    </div>
</div>

<div id="personalEventsModal" class="modal hide fade" tabindex="-1" role="window"
     aria-labelledby="personalEventsModalLabel" aria-hidden="true" style="width: 700px;">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                onclick="hidePersonalEventsModal();">×</button>
    </div>

    <div class="modal-body">
    </div>
</div>
</body>
</html>

