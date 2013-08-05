package eshop

import grails.converters.JSON
import grails.plugins.springsecurity.Secured

class OrderAdministrationController {

    def priceService
    def springSecurityService
    def mongoService
    def orderTrackingService
    def deliveryService

    def orderNotification() {
        def order = Order.get(params.id)
        if (orderTrackingService.checkIfOrderIsVisibleToUser(order, springSecurityService.currentUser)) {
            String result = ""
            order.items.each {
                result += it.productModel.toString()
                result += "<br/>"
            }
            result += "<a target='_blank' href='${createLink(controller: 'orderAdministration', action: 'act', params: [id: order.id])}'>${message(code: 'order.notification.link')}</a>"
            render result
        } else
            render 0
    }

    @Secured([RoleHelper.ROLE_VENDOR])
    def console() {

    }

    def list() {
        def orderList = orderTrackingService.filterOrderListForUser(Order.findAllByStatus(params.status), springSecurityService.currentUser)
        render view: '/orderAdministration/list', model: [orderList: orderList.size() > 0 ? orderList.collect { it.id.toLong() } : [0]]
    }

    def act() {
        def order = Order.get(params.id)
        def availableActions = []
        switch (order.status) {
            case OrderHelper.STATUS_CREATED:
                availableActions = [OrderHelper.ACTION_MARK_AS_INCORRECT, OrderHelper.ACTION_APPROVE]
                break
            case OrderHelper.STATUS_UPDATING:
                availableActions = [OrderHelper.ACTION_INQUIRY]
                break
            case OrderHelper.STATUS_PAID:
                availableActions = [OrderHelper.ACTION_TRANSMISSION]
                break
            case OrderHelper.STATUS_TRANSMITTED:
                availableActions = [OrderHelper.ACTION_DELIVERY]
                break
        }

        model: [
                order: order,
                actions: availableActions
        ]
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

        //update order
        priceService.updateOrderPrice(OrderItem.get(params.orderItem.id).order)

        redirect(action: 'act', params: [id: params.order.id])
    }

    def updateProductModelStatus() {

        def productModel = ProductModel.get(params.productModel.id)
        productModel.status = params.status
        productModel.save()

        //update order
        priceService.updateOrderPrice(OrderItem.get(params.orderItem.id).order)

        redirect(action: 'act', params: [id: params.order.id])
    }

    def actOnOrder(oldStatus, newStatus, action) {
        def order = Order.get(params.id)
        order.status = newStatus
        order.save()

        def trackingLog = new OrderTrackingLog()
        trackingLog.action = action
        trackingLog.date = new Date()
        trackingLog.order = order
        trackingLog.user = (User) springSecurityService.currentUser
        trackingLog.title = "order.actions.${action}"
        trackingLog.description = params.description
        if (!trackingLog.validate() || !trackingLog.save()) {
            //tracking log save error
            return
        }

        redirect(action: 'list', params: [status: oldStatus])
    }

    def act_markAsIncorrect() {
        actOnOrder(
                OrderHelper.STATUS_CREATED,
                OrderHelper.STATUS_INCORRECT,
                OrderHelper.ACTION_MARK_AS_INCORRECT)
    }

    def act_approve() {
        actOnOrder(
                OrderHelper.STATUS_CREATED,
                OrderHelper.STATUS_UPDATING,
                OrderHelper.ACTION_APPROVE)
    }

    def act_inquiry() {

        //set new prices
        def order = Order.get(params.id)
        priceService.updateOrderPrice(order)

        def validityDate = params.ValidityDate
        if (params.ValidityTime) {
            def hours = params.ValidityTime.toString().split(':')[0].toInteger()
            def minutes = params.ValidityTime.toString().split(':')[1].toInteger()
            validityDate.hours = hours
            validityDate.minutes = minutes
        }

        OrderJob.schedule(validityDate, [orderId: params.id])

        actOnOrder(
                OrderHelper.STATUS_UPDATING,
                OrderHelper.STATUS_INQUIRED,
                OrderHelper.ACTION_INQUIRY)
    }

    def act_transmission() {
        actOnOrder(
                OrderHelper.STATUS_PAID,
                OrderHelper.STATUS_TRANSMITTED,
                OrderHelper.ACTION_TRANSMISSION)
    }

    def act_delivery() {

        actOnOrder(
                OrderHelper.STATUS_TRANSMITTED,
                OrderHelper.STATUS_DELIVERED,
                OrderHelper.ACTION_DELIVERY)

        def order = Order.get(params.id)
        order.items.each {
            def product = Product.get it.productModel.product.id
            product.saleCount = product.saleCount ? product.saleCount + 1 : 0
            product.save()
            mongoService.storeProduct(product)
        }
    }
}
