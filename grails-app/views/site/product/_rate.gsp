
<span id="star${identifier}">
    <input type="hidden" name="${identifier}" id="${identifier}" />
</span>

<script language="javascript" src="${resource(dir: 'js', file: 'jquery.raty.js')}" type="text/javascript"></script>
<g:javascript>
    $('#${identifier}').val(${currentValue});
    $('#star${identifier}').raty({
        score: ${currentValue},
        readOnly:${readOnly},
        click: function(score, evt) {
            $('#${identifier}').val(score);
        }
    });
</g:javascript>
