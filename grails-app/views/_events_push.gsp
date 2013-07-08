%{--<atmosphere:resources/>--}%
<r:require module="grailsEvents"/>
<g:set var="rootPath" value="${createLink(uri: '/', absolute: true).toString()}"/>
<g:set var="rootPath" value="${rootPath.substring(0, rootPath.length() - 1)}"/>
<r:script>
    var receivedOrders = new Array();
    var grailsEvents = new grails.Events("${rootPath}");

    function handleOrderEvent(data){
        try{
            if(data.id){
                if (receivedOrders.indexOf(data.id) == -1) {
                    receivedOrders[receivedOrders.length] = data.id;
                    var url = "<g:createLink controller="orderAdministration" action="orderNotification"/>";
                    $.ajax({
                        type: "POST",
                        url: url,
                        data: { id: data.id }
                    }).done(function (response) {
                        if (response != "0") {
                            $.msgGrowl({
                                type: 'info', sticky: true, 'title': '${message(code: 'order.notification.title')}', 'text': response, lifetime: 5000
                            });
                        }
                    });
                }
            }
        }catch (e) {
        // Atmosphere sends commented out data to WebKit based browsers
        }
    }

    grailsEvents.on('order_event', handleOrderEvent, {transport:'sse', fallbackTransport:'long-polling'});

</r:script>
