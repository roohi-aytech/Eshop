package eshop

import eshop.accounting.Account
import eshop.accounting.CustomerTransaction
import eshop.accounting.Transaction
import eshop.delivery.DeliverySourceStation

class OrderController {

    def springSecurityService
    def priceService
    def mellatService
    def accountingService
    def jmsService
    def deliveryService

    static exposes = ['jms']

//    @grails.plugin.jms.Queue(name='order.new')
    def create() {

        //save order
        def order = (Order) session["order"]
        order.customer = (Customer) springSecurityService.currentUser
        order.status = OrderHelper.STATUS_CREATED

        def sendingAddress = (Address) session["sendingAddress"]
        sendingAddress.save()

        def billingAddress = (Address) session["billingAddress"]
        billingAddress.save()

        order.sendingAddress = sendingAddress
        order.billingAddress = billingAddress

        //delivery
        order.deliveryPrice = params.deliveryPrice?.toDouble()
        order.deliverySourceStation = DeliverySourceStation.get(params.deliverySourceStation)
        order.optionalInsurance = params.optionalInsurance.toBoolean()

        order.items?.clear();
        if (!order.validate() || !order.save()) {
            //order save error
            return
        }

        //save order tracking log
        def trackingLog = new OrderTrackingLog()
        trackingLog.action = OrderHelper.ACTION_CREATION
        trackingLog.date = new Date()
        trackingLog.order = order
        trackingLog.user = (User) springSecurityService.currentUser
        trackingLog.title = "order.actions.${OrderHelper.ACTION_CREATION}"
        if (!trackingLog.validate() || !trackingLog.save()) {
            //tracking log save error
            return
        }

        def basket = session.getAttribute("basket")
        basket.each() { basketItem ->
            def orderItem = new OrderItem()
            orderItem.productModel = ProductModel.get(basketItem.id)
            orderItem.order = order
            orderItem.orderCount = basketItem.count

            //added values
            basketItem.selectedAddedValues?.each { addedValue ->
                orderItem.addToAddedValues(AddedValue.get(addedValue.toLong()))
            }

            orderItem.save()
        }

        priceService.updateOrderPrice(order);

        session.setAttribute("basket", [])
        session.setAttribute("basketCounter", 0)

        event(topic: 'order_event', data: [id: order.id], namespace: 'browser')

        flash.message = message(code: 'order.creation.success.message')
        redirect(controller: 'customer', action: 'panel')
    }

//    @grails.plugin.jms.Queue(name='order.new')
    def testEvents() {
        event(topic: 'order_event', data: [id: 8], namespace: 'browser')
//        jmsService.send(topic:'order_event', [id:8])
        render 0
    }

    def payment() {

        def order = Order.get(params.id)
        def accountsForOnlinePayment = []
        [
                orderPrice: order.totalPrice,
                accountsForOnlinePayment: accountsForOnlinePayment,
                accounts: Account.findAllByType('legal'),
                customerAccountValue: accountingService.calculateCustomerAccountValue(springSecurityService.currentUser)
        ]
    }

    def onlinePayment() {
        if (params.bank) {
            def order = Order.get(params.id)
            switch (params.bank) {
                case 'mellat':
                    def result = mellatService.prepareForPayment(order.id, order.totalPrice, order.customerId)
                    if (result[0] == 0)
                        [refId: result[1]]
                    else
                        flash.message = result[0]
                    break
                case 'pasargad':
                    break
            }
        }
    }

    def list() {

        def status = params.status
        def orderList = Order.findAllByStatusAndCustomer(status, springSecurityService.currentUser)
        def actions = []
        def suggestedActions = []

        if (status == OrderHelper.STATUS_INQUIRED)
            suggestedActions = [OrderHelper.ACTION_PAYMENT]

        render view: '/order/list', model: [
                orderList: orderList.sort { -it.id },
                status: status,
                suggestedActions: suggestedActions,
                actions: actions,
        ]
    }

    def savePaymentRequest() {
        def paymentRequest = new PaymentRequest()
        paymentRequest.value = params.value.toInteger()
        paymentRequest.trackingCode = params.trackingCode
        paymentRequest.creationDate = new Date()
        paymentRequest.owner = (Customer) springSecurityService.currentUser
        paymentRequest.account = Account.get(params.account)
        paymentRequest.order = Order.get(params.order.id)
        paymentRequest.usingCustomerAccountValueAllowed = params.usingCustomerAccountValueAllowed
        if (paymentRequest.validate() && paymentRequest.save()) {
            flash.message = message(code: "order.payment.paymentRequest.succeed")
            redirect(action: 'payment', params: [id: params.order.id])
        }
    }

    def payOrderFromAccount() {

        def order = Order.get(params.order.id)
        def orderPrice = order.totalPrice
        def owner = springSecurityService.currentUser

        //save withdrawal customer transaction
        def customerTransaction = new CustomerTransaction()
        customerTransaction.value = orderPrice
        customerTransaction.date = new Date()
        customerTransaction.type = AccountingHelper.TRANSACTION_TYPE_WITHDRAWAL
        customerTransaction.order = order
        customerTransaction.creator = owner
        customerTransaction.save()

        //save withdrawal transaction
        def transaction = new Transaction()
        transaction.value = orderPrice
        transaction.date = new Date()
        transaction.type = AccountingHelper.TRANSACTION_TYPE_WITHDRAWAL
        transaction.order = order
        transaction.creator = owner
        transaction.save()

        //set order status
        order.status = OrderHelper.STATUS_PAID
        order.save()

        //save order tracking log
        def trackingLog = new OrderTrackingLog()
        trackingLog.action = OrderHelper.ACTION_PAYMENT
        trackingLog.date = new Date()
        trackingLog.order = order
        trackingLog.user = owner
        trackingLog.title = "order.actions.${OrderHelper.ACTION_PAYMENT}"
        if (trackingLog.validate() && trackingLog.save()) {
            flash.message = message(code: 'order.payment.completed')
            redirect(controller: 'customer', action: 'panel')
        }
    }

    def invoice() {
        def order = Order.get(params.id)
        def title = message(code: 'order.preInvoice.title')
        switch (order.status) {
            case OrderHelper.STATUS_PAID:
                title = message(code: 'order.finalInvoice.title')
                break
            case OrderHelper.STATUS_TRANSMITTED:
                title = message(code: 'order.finalInvoice.title')
                break
            case OrderHelper.STATUS_DELIVERED:
                title = message(code: 'order.finalInvoice.title')
                break
        }
        render template: 'invoice', model: [order: order, title: title]
    }

//    def cancellation(){
//        def order = Order.get(params.id)
//        order.status = OrderHelper.STATUS_CANCELLED
//        order.save()
//
//        //save order tracking log
//        def trackingLog = new OrderTrackingLog()
//        trackingLog.action = OrderHelper.ACTION_CANCELLATION
//        trackingLog.date = new Date()
//        trackingLog.order = order
//        trackingLog.user = springSecurityService.currentUser
//        trackingLog.title = "order.actions.cancellation"
//        if (trackingLog.validate() && trackingLog.save()) {
//            flash.message = message(code:'order.cancellation.completed')
//            redirect(controller: 'customer', action: 'panel')
//        }
//    }

//    def reactivation(){
//        def order = Order.get(params.id)
//        order.status = OrderHelper.STATUS_CREATED
//        order.save()
//
//        //save order tracking log
//        def trackingLog = new OrderTrackingLog()
//        trackingLog.action = OrderHelper.ACTION_REACTIVATION
//        trackingLog.date = new Date()
//        trackingLog.order = order
//        trackingLog.user = springSecurityService.currentUser
//        trackingLog.title = message(code: 'order.trackingLog.action.reactivation.title', params: [trackingLog.date, trackingLog.user])
//        if (trackingLog.validate() && trackingLog.save()) {
//            flash.message = message(code:'order.reactivation.completed')
//            redirect(controller: 'customer', action: 'panel')
//        }
//    }

}
