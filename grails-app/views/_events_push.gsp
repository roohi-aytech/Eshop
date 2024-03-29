%{--<atmosphere:resources/>--}%
%{--<r:require module="grailsEvents"/>--}%
<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.atmosphere.js')}"></script>
<script type="text/javascript" src="${resource(plugin: 'events-push', dir: 'js/grails', file: 'grailsEvents.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'grailsEventsOverride.js')}"></script>
%{--<g:set var="rootPath" value="${createLink(uri: '/', absolute: true).toString()}"/>--}%
%{--<g:set var="rootPath" value="${rootPath.substring(0, rootPath.length() - 1)}"/>--}%
%{--<g:if test="${request.scheme=="https"}">--}%
    %{--<g:set var="rootPath" value="${rootPath.replace("http:","https:")}"/>--}%
%{--</g:if>--}%
<script type="text/javascript" language="javascript">
    var receivedOrders = new Array();
    var grailsEvents = new grails.Events("${grailsApplication.config.events.url}");

    function handleOrderEvent(data){
        try{
            if(data.id){
                if (receivedOrders.indexOf(data.id + "_" + data.status) == -1) {
                    receivedOrders[receivedOrders.length] = data.id + "_" + data.status;
                    var url = "<g:createLink controller="orderAdministration" action="orderNotification" />";
                    $.ajax({
                        type: "POST",
                        url: url,
                        data: { id: data.id, userName: '${sec.username()}' }
                    }).done(function (response) {
                        if (response != "0") {
                            $.msgGrowl({
                                type: 'info', sticky: true, 'title': response.title, 'text': response.body, lifetime: 5000
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

</script>
