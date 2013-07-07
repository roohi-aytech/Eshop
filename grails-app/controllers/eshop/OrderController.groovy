package eshop

import eshop.accounting.Account
import eshop.accounting.CustomerTransaction
import eshop.accounting.Transaction

class OrderController {

    def springSecurityService
    def priceService
    def mellatService
    def accountingService
    def jmsService

    static exposes = ['jms']

//    @grails.plugin.jms.Queue(name='order.new')
    def create() {

        //save order
        def order = (Order)session["order"]
        order.customer = (Customer) springSecurityService.currentUser
        order.status = OrderHelper.STATUS_CREATED

        def sendingAddress = (Address)session["sendingAddress"]
        sendingAddress.save()

        def billingAddress = (Address)session["billingAddress"]
        billingAddress.save()

        order.sendingAddress = sendingAddress
        order.billingAddress = billingAddress

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
        trackingLog.title = message(code: 'order.trackingLog.action.creation.title', params: [trackingLog.date, trackingLog.user])
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
            def price = priceService.calcProductModelPrice(basketItem.id).valueAddedVal
            orderItem.unitPrice = price ? price : 0
            if (!orderItem.validate() || !orderItem.save()) {
                //order item save error
            }
        }

        session.setAttribute("basket", [])
        session.setAttribute("basketCounter", 0)

        event(topic:'order_event', data:[id:order.id], namespace:'browser')

        flash.message = message(code: 'order.creation.success.message')
        redirect(controller: 'customer', action: 'panel')
    }

//    @grails.plugin.jms.Queue(name='order.new')
    def testEvents(){
        event(topic:'order_event', data:[id:8], namespace:'browser')
//        jmsService.send(topic:'order_event', [id:8])
        render 0
    }

    def payment(){
        [
                orderPrice:Order.get(params.id).items.sum{it.productModel.status == 'exists'? it.orderCount * it.unitPrice:0},
                accountsForOnlinePayment: Account.findAllByHasOnlinePayment(true),
                accounts: Account.findAll(),
                customerAccountValue: accountingService.calculateCustomerAccountValue(springSecurityService.currentUser)
        ]
    }

    def onlinePayment() {
        if (params.bank) {
            def order = Order.get(params.id)
            switch (params.bank) {
                case 'mellat':
                    def result = mellatService.prepareForPayment(order.id, order.items.sum { it.orderCount * it.unitPrice }, order.customerId)
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

        switch (status) {
            case OrderHelper.STATUS_CREATED:
                suggestedActions = []
                actions = [OrderHelper.ACTION_CANCELLATION]
                break;
            case OrderHelper.STATUS_INQUIRED:
                suggestedActions = [OrderHelper.ACTION_PAYMENT]
                actions = [OrderHelper.ACTION_CANCELLATION]
                break;
            case OrderHelper.STATUS_PAID:
                suggestedActions = []
                actions = []
                break;
            case OrderHelper.STATUS_TRANSMITTED:
                suggestedActions = []
                actions = []
                break;
            case OrderHelper.STATUS_DELIVERED:
                suggestedActions = []
                actions = []
                break;
            case OrderHelper.STATUS_CANCELLED:
                suggestedActions = [OrderHelper.ACTION_REACTIVATION]
                break;
        }

        render view: '/order/list', model: [
                orderList: orderList.sort { -it.id },
                status: status,
                suggestedActions: suggestedActions,
                actions: actions,
        ]
    }

    def savePaymentRequest(){
        def paymentRequest = new PaymentRequest()
        paymentRequest.value = params.value.toInteger()
        paymentRequest.trackingCode = params.trackingCode
        paymentRequest.creationDate = new Date()
        paymentRequest.owner = (Customer)springSecurityService.currentUser
        paymentRequest.account = Account.get(params.account)
        paymentRequest.order = Order.get(params.order.id)
        paymentRequest.usingCustomerAccountValueAllowed = params.usingCustomerAccountValueAllowed
        if(paymentRequest.validate() && paymentRequest.save()){
            flash.message = message(code:"order.payment.paymentRequest.succeed")
            redirect(action: 'payment', params: [id:params.order.id])
        }
    }

    def payOrderFromAccount(){

        def order = Order.get(params.order.id)
        def orderPrice = order.items.sum{it.productModel.status == 'exists'? it.orderCount * it.unitPrice:0}
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
        trackingLog.title = message(code: 'order.trackingLog.action.payment.title', params: [trackingLog.date, trackingLog.user])
        if (trackingLog.validate() && trackingLog.save()) {
            flash.message = message(code:'order.payment.completed')
            redirect(controller: 'customer', action: 'panel')
        }
    }

    def cancellation(){
        def order = Order.get(params.id)
        order.status = OrderHelper.STATUS_CANCELLED
        order.save()

        //save order tracking log
        def trackingLog = new OrderTrackingLog()
        trackingLog.action = OrderHelper.ACTION_CANCELLATION
        trackingLog.date = new Date()
        trackingLog.order = order
        trackingLog.user = springSecurityService.currentUser
        trackingLog.title = message(code: 'order.trackingLog.action.cancellation.title', params: [trackingLog.date, trackingLog.user])
        if (trackingLog.validate() && trackingLog.save()) {
            flash.message = message(code:'order.cancellation.completed')
            redirect(controller: 'customer', action: 'panel')
        }
    }

    def reactivation(){
        def order = Order.get(params.id)
        order.status = OrderHelper.STATUS_CREATED
        order.save()

        //save order tracking log
        def trackingLog = new OrderTrackingLog()
        trackingLog.action = OrderHelper.ACTION_REACTIVATION
        trackingLog.date = new Date()
        trackingLog.order = order
        trackingLog.user = springSecurityService.currentUser
        trackingLog.title = message(code: 'order.trackingLog.action.reactivation.title', params: [trackingLog.date, trackingLog.user])
        if (trackingLog.validate() && trackingLog.save()) {
            flash.message = message(code:'order.reactivation.completed')
            redirect(controller: 'customer', action: 'panel')
        }
    }

}
