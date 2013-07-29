<style>
.history li {
    display: block;
    border: 1px solid #eeeeee;
    background: #f8f8f8;
    border-radius: 4px;
    margin: 5px;
    padding: 5px;
    line-height: 18px;
}

.history .title {
    font-weight: bold;
}

.history .user {
    color: #808080;
}

.history .date {
    color: #808080;
}

.history
</style>

<ul class="history">
    <g:each in="${eshop.OrderTrackingLog.findAllByOrder(order)}" var="trackingLog">
        <li>
            <div class="title"><g:message code="${trackingLog.title}"/></div>

            <div>
                <span class="user">${trackingLog.user}</span>
                <span class="date"><rg:formatJalaliDate date="${trackingLog.date}" hm="true"/></span>
                %{--<span class="action">${trackingLog.action}</span>--}%
            </div>

            <div class="description">${trackingLog.description}</div>
        </li>
    </g:each>
</ul>
