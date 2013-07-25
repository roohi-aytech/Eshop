<html>
<head>
    <meta name='layout' content='site'/>
    <title><g:message code="profile"/></title>
    <style type='text/css' media='screen'>

    .tabbable {
        margin-top: 0 !important;
    }

    select {
        width: 230px;
        margin-bottom: 0 !important;
    }

    .hasDatepicker {
        background: none repeat scroll 0 0 white !important;
        box-shadow: none !important;
        cursor: default !important;
        margin-right: 10px;
        margin-top: -5px;
    }

    #reagentFullName {
        font-weight: bold;
    }

    #reagentEmail {
        width: 300px !important;
    }

    input, select, textarea {
        display: block !important;
        margin-top: 3px;
        margin-right: 0 !important;
    }

    input[type=text] {
        width: 300px;
    }

    select {
        width: 314px;
    }

    textarea {
        width: 500px;
        height: 120px;
    }

    .ui-datepicker-title select {
        display: inline !important;
    }

    .tab-pane {
        padding-right: 10px;
    }
    </style>
    <link href="${resource(plugin: 'jquery-ui', dir: 'jquery-ui/themes/cobalt', file: 'jquery-ui-1.8.15.custom.css')}"
          type="text/css" rel="stylesheet" media="screen, projection" id="jquery-ui-theme"/>
    <script src="${resource(plugin: 'jquery-ui', dir: 'jquery-ui/js', file: 'jquery-ui-1.8.15.custom.min.js')}"
            type="text/javascript"></script>
    href="${resource(plugin: 'rapid-grails', dir: 'css/datepicker', file: 'ui.datepicker.css')}"/>
    <script src="${resource(plugin: 'rapid-grails', dir: 'js/datepicker', file: 'jquery.ui.datepicker-cc.js')}"
            type="text/javascript"></script>
    <script src="${resource(plugin: 'rapid-grails', dir: 'js/datepicker', file: 'calendar.js')}"
            type="text/javascript"></script>
    <script src="${resource(plugin: 'rapid-grails', dir: 'js/datepicker', file: 'jquery.ui.datepicker-cc-fa.js')}"
            type="text/javascript"></script>

</head>

<body>
<div id='register'>
    <div class='inner'>
        <g:hiddenField name="id" value="${customerInstance?.id}"/>
        <g:hiddenField name="version" value="${customerInstance?.version}"/>

        <g:hasErrors bean="${customerInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${customerInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>

        <div class="tabbable">
            <ul class="nav nav-tabs">
                <li class="${!params.tab || params.tab == 'personal' ? 'active': ''}"><a href="#tab1" data-toggle="tab"><g:message code="edit.profile.label"/></a></li>
                <li class="${params.tab == 'address' ? 'active': ''}"><a href="#tab2" data-toggle="tab"><g:message code="springSecurity.register.sendingAddress.label"/></a></li>
                <li class="${params.tab == 'reagent' ? 'active': ''}"><a href="#tab3" data-toggle="tab"><g:message code="customer.reagent.label"/></a></li>
                <li class="${params.tab == 'favorites' ? 'active': ''}"><a href="#tab4" data-toggle="tab"><g:message code="customer.favorites.label"/></a></li>
                <li class="${params.tab == 'newsLetter' ? 'active': ''}"><a href="#tab5" data-toggle="tab"><g:message code="controlPanel.settings.profile.newsLetters.label"/></a></li>
            </ul>

            <div class="tab-content">
                <div id="tab1" class="tab-pane ${!params.tab || params.tab == 'personal' ? 'active': ''}">
                    <g:render template="profile/personalInfo"></g:render>
                </div>

                <div id="tab2" class="tab-pane ${params.tab == 'address' ? 'active': ''}">
                    <g:render template="profile/address"></g:render>
                </div>

                <div id="tab3" class="tab-pane ${params.tab == 'reagent' ? 'active': ''}">
                    <g:render template="profile/reagent"></g:render>
                </div>

                <div id="tab4" class="tab-pane ${params.tab == 'favorites' ? 'active': ''}">
                    <g:render template="profile/favorites"></g:render>
                </div>

                <div id="tab5" class="tab-pane ${params.tab == 'newsLetter' ? 'active': ''}">
                    <g:render template="profile/newsLetter"></g:render>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
</html>
