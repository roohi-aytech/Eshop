%{--<atmosphere:resources/>--}%
<r:require module="grailsEvents"/>
<g:set var="rootPath" value="${createLink(uri: '/', absolute: true).toString()}"/>
<g:set var="rootPath" value="${rootPath.substring(0, rootPath.length() - 1)}"/>
<r:script>
    var receivedOrders = new Array();
    var grailsEvents = new grails.Events("${rootPath}");
    %{--{--}%
        %{--transport: 'sse',--}%
        %{--fallbackTransport: 'long-polling',--}%
        %{--timeout: 10000,--}%
        %{--onMessage: function(data){--}%
            %{--try{--}%
                %{--if(data.responseBody.length > 0){--}%
                    %{--var order = jQuery.parseJSON(data.responseBody).body;--}%
                    %{--if(order.id){--}%
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
                                            %{--type: 'info', sticky: true, 'title': '${message(code: 'order.notification.title')}', 'text': response, lifetime: 5000--}%
                                        %{--});--}%
                                    %{--}--}%
                                %{--});--}%
                        %{--}--}%
                    %{--}--}%
                %{--}--}%
            %{--} catch (e) {--}%
                %{--// Atmosphere sends commented out data to WebKit based browsers--}%
            %{--}--}%
        %{--}--}%
    %{--});--}%

    grailsEvents.on('order_event', function(data){window.alert(data);});
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