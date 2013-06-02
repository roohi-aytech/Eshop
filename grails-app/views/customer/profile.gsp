<html>
<head>
    <meta name='layout' content='site'/>
    <title><g:message code="profile"/></title>
    <style type='text/css' media='screen'>
        #register {
            margin: 15px 0px;
            padding: 0px;
            text-align: center;
        }

        #register .inner {
            width: 500px;
            margin: 40px auto;
            text-align: right;
            border: 1px solid #dddddd;
            background-color: #fafafa;
            border-radius: 5px;
            padding: 5px;
        }

        #register .inner .fheader {
            padding: 5px;
            background-color: #f0f0f0;
            margin: 0px 0 0px 0;
            color: #2e3741;
            font-size: 11px;
            border-radius: 5px;
            margin-bottom: 5px;
        }

        #register .inner .cssform p {
            clear: right;
            margin: 0;
            padding: 5px;
            padding-right: 10px;
        }

        #register .inner .cssform input[type='text'], #register .inner .cssform input[type='password'] {
            width: 215px;
            margin-bottom: 0;
        }

        #register .inner .cssform textarea {
            width: 465px;
            margin-bottom: 0;
        }

        #register .inner .cssform label {
            /*float: right;*/
            text-align: right;
            padding-bottom: 3px;
            display: inline-block;
        }

        #register #remember_me_holder {
        }

        #register #submit {
            margin-right: 15px;
        }

        #register #remember_me_holder label {
            float: none;
            margin-right: 0;
            text-align: right;
            width: 150px;
            display: inline-block;
            padding-bottom: 0;
        }

        #register .inner .register_message {
            padding: 6px 25px 20px 25px;
            color: #c33;
        }

        #register .inner .text_ {
            width: 160px;
        }

        #register .inner .chk {
            height: 12px;
        }

        #register .toolbar {
            text-align: left;
        }

        #register input[type='submit'] {
            margin-left: 5px;
        }

        #register form {
            margin: 0;
            position: relative;
        }

        #register .column1 {
            display: inline-block;
            width: 250px;
            /*position: absolute;*/
            top: 0;
            right: 0;
        }

        #register .column2 {
            display: inline-block;
            width: 250px;
            position: absolute;
            top: 0;
            left: 0;
        }

        #register textarea {
            height: 83px;
        }

        .tabbable {
            margin: 0 !important;
        }

        .nav-tabs {
            background: #eeeeee;
            padding: 5px;
            border-radius: 5px 5px 0 0;
            padding-bottom: 0;
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

        .border{
            border:1px solid #eeeeee;
            box-shadow: 0 0 2px #eeeeee;
            display: none;
            background-color: #ffffff;
            border-radius: 5px;
            padding: 5px;
        }

        #reagentFullName{
            font-weight: bold;
        }

        #reagentEmail{
            width: 300px !important;
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
                <li class="${customerInstance.registrationLevel != 'basic' || !customerInstance.profilePersonalInfoFilled ? 'active' : ''}"><a
                        href="#tab1" data-toggle="tab"><g:message code="edit.profile.label"/></a></li>
                <li class="${customerInstance.profilePersonalInfoFilled && !customerInstance.profileSendingAddressFilled ? 'active' : ''}"><a
                        href="#tab2" data-toggle="tab"><g:message
                            code="springSecurity.register.sendingAddress.label"/></a></li>
                <li><a href="#tab3" data-toggle="tab"><g:message code="customer.reagent.label"/></a></li>
            </ul>

            <div class="tab-content">
                <div id="tab1"
                     class="tab-pane ${customerInstance.registrationLevel != 'basic' || !customerInstance.profilePersonalInfoFilled ? 'active' : ''}">
                    <g:render template="profile/personalInfo"></g:render>
                </div>

                <div id="tab2"
                     class="tab-pane ${customerInstance.profilePersonalInfoFilled && !customerInstance.profileSendingAddressFilled ? 'active' : ''}"">
            <g:render template="profile/address"></g:render>
            </div>

            <div id="tab3" class="tab-pane">
                <g:render template="profile/reagent"></g:render>
            </div>
        </div>
    </div>

</div>
</div>
</body>
</html>
