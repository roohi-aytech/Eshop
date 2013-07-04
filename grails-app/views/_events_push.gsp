<atmosphere:resources/>
<script type="text/javascript">
    //    if(!Array.prototype.indexOf) {
    //        Array.prototype.indexOf = function(needle) {
    //            for(var i = 0; i < this.length; i++) {
    //                if(this[i] === needle) {
    //                    return i;
    //                }
    //            }
    //            return -1;
    //        };
    //    }

    var receivedOrders = new Array();
    $(document).ready(function () {
        // jquery.atmosphere.response
        function callback(response) {
            if (response.status == 200) {
                var data = response.responseBody;
                if (data.length > 0) {
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
                                            type: 'info', sticky: true, 'title': '${message(code:'order.notification.title')}', 'text': response, lifetime: 5000
                                        });
                                    }
                                });
                        }
                    } catch (e) {
                        // Atmosphere sends commented out data to WebKit based browsers
                    }
                }
            }
        }

        var location = 'http://localhost:8080/EShop/atmosphere/orders';
        $.atmosphere.subscribe(location, callback, $.atmosphere.request = {transport: 'long-polling', fallbackTransport: 'polling'});
    });
</script>