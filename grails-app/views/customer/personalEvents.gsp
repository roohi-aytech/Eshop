<html>
<head>
    <meta name='layout' content='site'/>
    <title><g:message code="profile"/></title>

    <jqui:resources theme="${grailsApplication.config.admin.theme}"/>
    <link rel="stylesheet"
          href="${resource(dir: 'css/datepicker', file: 'ui.datepicker.css', plugin: 'rapid-grails')}"/>
    <script src="${resource(dir: 'js/datepicker', file: 'jquery.ui.datepicker-cc.js', plugin: 'rapid-grails')}" language="javascript" type="text/javascript"></script>
    <script src="${resource(dir: 'js/datepicker', file: 'calendar.js', plugin: 'rapid-grails')}" language="javascript" type="text/javascript"></script>
    <script src="${resource(dir: 'js/datepicker', file: 'jquery.ui.datepicker-cc-fa.js', plugin: 'rapid-grails')}" language="javascript" type="text/javascript"></script>
    <link href="${resource(dir: 'css/jquery.easyui/metro', file: 'easyui.css')}" rel="stylesheet" type="text/css"/>
    <link href="${resource(dir: 'css/jquery.easyui', file: 'easyui-rtl.css')}" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${resource(dir: 'js/jquery.easyui', file: 'jquery.draggable.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/jquery.easyui', file: 'jquery.panel.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/jquery.easyui', file: 'jquery.parser.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/jquery.easyui', file: 'jquery.validatebox.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/jquery.easyui', file: 'jquery.tree.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/jquery.easyui', file: 'jquery.combo.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/jquery.easyui', file: 'jquery.combotree.js')}"></script>

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
        <g:each in="${customerInstance.personalEvents.sort { it.id }}" var="personalEvent">
            <tr>
                <td><img class="action-btn" original-title="${message(code: 'edit')}" style="cursor: pointer"
                         onclick="showEditersonalEventsModal(${personalEvent.id});"
                         src="${resource(dir: 'images', file: 'personal_event_edit.png')}"/></td>
                <td><a href="${createLink(controller: 'personalEvent', action: 'delete', params: [id: personalEvent.id])}"><img
                        class="action-btn" original-title="${message(code: 'delete')}"
                        src="${resource(dir: 'images', file: 'personal_event_delete.png')}"/></a></td>
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

