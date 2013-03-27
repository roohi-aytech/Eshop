
<span id="star${identifier}">
    <input type="hidden" name="${identifier}" id="${identifier}" />
</span>

<g:javascript src="jquery.raty.js"></g:javascript>
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
