<a onclick="vote(${customerReviewInstance.id}, 1)">
    <img src="${resource(dir: 'images', file: 'vote_up.png')}"/>
</a>
<span class="comment-vote">
    <span id="voteValue_${customerReviewInstance.id}">${customerReviewInstance.totalVotes}</span>
</span>
<a onclick="vote(${customerReviewInstance.id}, -1)">
    <img src="${resource(dir: 'images', file: 'vote_down.png')}"/>
</a>
<span>
    <img id="voteWaiting_${customerReviewInstance.id}" class="waiting"
         src="${resource(dir: 'images', file: 'loading.gif')}"/>
</span>