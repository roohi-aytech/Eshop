%{--<atmosphere:resources/>--}%
<r:require module="grailsEvents"/>
<r:script>
    var receivedOrders = new Array();
    var grailsEvents = new grails.Events("${createLink(uri:'/', absolute: true)}");
//    grailsEvents.send('saveTodo', data); //will send data to server topic 'saveTodo'
    grailsEvents.on('order_event', function(data){
        try {
            var order = jQuery.parseJSON(data);
            if (receivedOrders.indexOf(order.id) == -1) {
            receivedOrders[receivedOrders.length] = order.id;
            var url = "<g:createLink controller="orderAdministration" action="orderNotification"/>";
            $.ajax({
                type: "POST",
                url: url,
                data: { id: order.id }
            }).done(function (response) {
                        if (response != "0") {
                            $.msgGrowl({
                                type: 'info', sticky: true, 'title': '${message(code: 'order.notification.title')}', 'text': response, lifetime: 5000
                            });
                        }
                    });
            }
        } catch (e) {
            // Atmosphere sends commented out data to WebKit based browsers
        }
    }); //will listen for server events on 'savedTodo' topic
</r:script>
%{--<script type="text/javascript">--}%

    %{--$(document).ready(function () {--}%
        %{--// jquery.atmosphere.response--}%
        %{--function callback(response) {--}%
            %{--if (response.status == 200) {--}%
                %{--var data = response.responseBody;--}%
                %{--if (data.length > 0) {--}%
                    %{--try {--}%
                        %{--var order = jQuery.parseJSON(data);--}%
                        %{--if (receivedOrders.indexOf(order.id) == -1) {--}%
                            %{--receivedOrders[receivedOrders.length] = order.id;--}%
                            %{--var url = "<g:createLink controller="orderAdministration" action="orderNotification"/>";--}%
                            %{--$.ajax({--}%
                                %{--type: "POST",--}%
                                %{--url: url,--}%
                                %{--data: { id: order.id }--}%
                            %{--}).done(function (response) {--}%
                                        %{--if (response != "0") {--}%
                                            %{--$.msgGrowl({--}%
                                                %{--type: 'info', sticky: true, 'title': '${message(code:'order.notification.title')}', 'text': response, lifetime: 5000--}%
                                            %{--});--}%
                                        %{--}--}%
                                    %{--});--}%
                        %{--}--}%
                    %{--} catch (e) {--}%
                        %{--// Atmosphere sends commented out data to WebKit based browsers--}%
                    %{--}--}%
                %{--}--}%
            %{--}--}%
        %{--}--}%

        %{--var locationy
         = 'http://localhost:8080/EShop/atmosphere/orders';--}%
        %{--$.atmosphere.subscribe(location, callback, $.atmosphere.request = {transport: 'long-polling', fallbackTransport: 'polling'});--}%
    %{--});--}%
%{--</script>--}%