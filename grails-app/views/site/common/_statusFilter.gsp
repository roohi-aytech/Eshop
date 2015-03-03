<div class="statusFilter">
    <div class="toggle-soft"></div>
    <span><g:message code="statusFilter.label"/></span>
</div>
<script language="javascript" type="text/javascript">
    $('.toggle-soft').toggles({
        drag: true, // allow dragging the toggle between positions
        click: true, // allow clicking on the toggle
        text: {
            on: '${message(code:'true')}', // text for the ON position
            off: '${message(code:'false')}' // and off
        },
        on: ${session['status_filter']}, // is the toggle ON on init
        animate: 250, // animation time
        transition: 'swing', // animation transition,
        checkbox: null, // the checkbox to toggle (for use in forms)
        clicker: null, // element that can be clicked on to toggle. removes binding from the toggle itself (use nesting)
        width: 50, // width used if not set in css
        height: 20, // height if not set in css
        type: 'compact' // if this is set to 'select' then the select style toggle will be used
    }).on('toggle', function (e, active) {
        var sw = 'off'
        if (active)
            sw = 'on';
        $.ajax({
            type: "POST",
            url: '${createLink(controller: 'site', action: 'productStatusFilter')}',
            data: { value: sw }
        }).done(function (response) {
            window.location.href = window.location.href;
        });
    });
</script>