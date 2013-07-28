package eshop



class OrderJob {
    static triggers = {
    }

    def execute(params) {
        def order = Order.get(params.jobDataMap.orderId)
        if(order.status == OrderHelper.STATUS_INQUIRED){
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
