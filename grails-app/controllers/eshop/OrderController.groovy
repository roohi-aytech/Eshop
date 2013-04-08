package eshop

class OrderController {

    def springSecurityService

    def create(){

        //save order
        def order = new Order()
        order.customer = (Customer)springSecurityService.currentUser
        order.status = OrderHelper.STATUS_CREATED
        order.sendingAddress = order.customer.sendingAddress
        order.billingAddress = order.customer.billingAddress
        if(!order.validate() || !order.save()){
            //order save error
            return
        }

        //save order tracking log
        def trackingLog = new OrderTrackingLog()
        trackingLog.action = OrderHelper.ACTION_CREATION
        trackingLog.date = new Date()
        trackingLog.order = order
        trackingLog.user = (User)springSecurityService.currentUser
        trackingLog.title = message(code: 'order.trackingLog.action.creation.title', params:[trackingLog.date, trackingLog.user])
        if (!trackingLog.validate() || !trackingLog.save()){
            //tracking log save error
            return
        }

        def basket = session.getAttribute("basket")
        basket.each(){basketItem ->
            def orderItem = new OrderItem()
            orderItem.product = Product.get(basketItem.id)
            orderItem.order = order
            orderItem.orderCount = basketItem.count
            if (!orderItem.validate() || !orderItem.save()){
                //order item save error
            }
        }
    }

    def pay

}
