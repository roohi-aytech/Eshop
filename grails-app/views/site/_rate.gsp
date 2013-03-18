
<span id="star"></span>

<g:javascript src="jquery.raty.js"></g:javascript>
<g:javascript>
    var alreadyRated = false;
    $('#star').raty({
        score: 3,
        click: function(score, evt) {
            saveScore(score);
            $('#star').html();
            $('#star').raty({
                score: score,
                readOnly: true,
                click: function(score, evt) {
                    saveScore(score);
                    readOnly:true
                }
            });
        }
    });

    function saveScore(score){
        alert('score: ' + score);
    }
</g:javascript>
