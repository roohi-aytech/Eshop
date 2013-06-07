package eshop

import grails.converters.JSON

class OrderAdministrationController {

    def priceService
    def springSecurityService
    def mongoService

    def list() {
        render view: '/orderAdministration/list'
    }

    def act() {
        def order = Order.get(params.id)
        render(
                view: "/orderAdministration/act/${order.status}",
                model: [order: order]
        )
    }

    def updatePrice() {

        //save new price
        def priceInstance = new Price(params)
        priceInstance.productModel = ProductModel.get(params.productModel.id)
        def lastPrice = Price.findByProductModelAndEndDateIsNull(priceInstance.productModel)
        if (lastPrice) {
            lastPrice.endDate = new Date()
            lastPrice.save()
        }

        priceInstance.startDate = new Date()
        priceInstance.rialPrice = priceInstance.currency ? priceInstance.price * priceInstance.currency.exchangeRate : priceInstance.price
        priceInstance.save()

        //update order item
        def orderItem = OrderItem.get(params.orderItem.id)
        orderItem.unitPrice = priceService.calcProductModelPrice(priceInstance.productModel.id).showVal?:0

        redirect(action: 'act', params: [id:params.order.id])
    }

    def updateProductModelStatus(){

        def productModel = ProductModel.get(params.productModel.id)
        productModel.status = params.status

        redirect(action: 'act', params: [id:params.order.id])
    }

    def actcreated(){
        def order = Order.get(params.id)
        order.status = OrderHelper.STATUS_INQUIRED
        order.save()

        def trackingLog = new OrderTrackingLog()
        trackingLog.action = OrderHelper.ACTION_INQUIRY
        trackingLog.date = new Date()
        trackingLog.order = order
        trackingLog.user = (User) springSecurityService.currentUser
        trackingLog.title = message(code: 'order.trackingLog.action.inquiry.title', params: [trackingLog.date, trackingLog.user])
        trackingLog.description = params.description
        if (!trackingLog.validate() || !trackingLog.save()) {
            //tracking log save error
            return
        }

        redirect(action: 'list', params:[status:OrderHelper.STATUS_CREATED])
    }

    def actpaid(){
        def order = Order.get(params.id)
        order.status = OrderHelper.STATUS_TRANSMITTED
        order.save()

        def trackingLog = new OrderTrackingLog()
        trackingLog.action = OrderHelper.ACTION_TRANSMISSION
        trackingLog.date = new Date()
        trackingLog.order = order
        trackingLog.user = (User) springSecurityService.currentUser
        trackingLog.title = message(code: 'order.trackingLog.action.transmission.title', params: [trackingLog.date, trackingLog.user])
        trackingLog.description = params.description
        if (!trackingLog.validate() || !trackingLog.save()) {
            //tracking log save error
            return
        }

        redirect(action: 'list', params:[status:OrderHelper.STATUS_PAID])
    }

    def acttransmitted(){
        def order = Order.get(params.id)
        order.status = OrderHelper.STATUS_DELIVERED
        order.save()
        order.items.each{
            mongoService.storeProduct(it.productModel.product)
        }

        def trackingLog = new OrderTrackingLog()
        trackingLog.action = OrderHelper.ACTION_DELIVERY
        trackingLog.date = new Date()
        trackingLog.order = order
        trackingLog.user = (User) springSecurityService.currentUser
        trackingLog.title = message(code: 'order.trackingLog.action.delivery.title', params: [trackingLog.date, trackingLog.user])
        trackingLog.description = params.description
        if (!trackingLog.validate() || !trackingLog.save()) {
            //tracking log save error
            return
        }

        redirect(action: 'list', params:[status:OrderHelper.STATUS_TRANSMITTED])
    }
}
