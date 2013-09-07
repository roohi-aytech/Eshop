
<span id="star${identifier}">
    <input type="hidden" name="${identifier}" id="${identifier}" />
</span>

<p:javascript src="jquery.raty"/>
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
