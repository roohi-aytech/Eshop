package eshop



class OrderJob {

    def concurrent = false

    static triggers = {
        simple repeatInterval: 60000, startDelay: 60000 // execute job once in 2 minutes
    }

    def execute(params) {
        def ord = Order.get(params.jobDataMap.orderId)
        def orderList = Order.createCriteria().list {
            eq('status', OrderHelper.STATUS_INQUIRED)
            lt('paymentTimeout', new Date())
        }

        if(ord && !orderList.any{it?.id == ord?.id})
            orderList << ord

           orderList.each { order ->
               if (order?.status == OrderHelper.STATUS_INQUIRED) {
                   order.status = OrderHelper.STATUS_INCOMPLETE
                   order.save(flash: true)

                   def trackingLog = new OrderTrackingLog()
                   trackingLog.action = OrderHelper.ACTION_MARK_AS_INCOMPLETE
                   trackingLog.date = new Date()
                   trackingLog.order = order
                   trackingLog.title = "order.actions.${OrderHelper.ACTION_MARK_AS_INCOMPLETE}"
                   trackingLog.save(flash: true)
               }
           }
    }
}
