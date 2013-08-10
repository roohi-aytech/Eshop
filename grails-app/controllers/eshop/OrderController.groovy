package eshop

import eshop.accounting.Account
import eshop.accounting.AccountFilter
import eshop.accounting.CustomerTransaction
import eshop.accounting.OnlinePayment
import eshop.accounting.PaymentRequest
import eshop.accounting.Transaction
import eshop.delivery.DeliverySourceStation
import fi.joensuu.joyds1.calendar.JalaliCalendar

class OrderController {

    def springSecurityService
    def priceService
    def mellatService
    def accountingService
    def jmsService
    def deliveryService
    def mailService
    def messageService

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


        //set tracking code
        def cal = Calendar.getInstance()
        cal.setTime(new Date())
        def jc = new JalaliCalendar(cal)
        order.trackingCode = String.format(
                "%02d%02d%02d%01d%03d",
                jc.getYear() % 100,
                jc.getMonth(),
                jc.getDay(),
                0, //customer type flag
                order.id % 1000
        )

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

        def accountsForOnlinePayment = new ArrayList<Account>()
        OrderItem.findAllByOrder(order).each { orderItem ->
            def productType = orderItem.productModel.product.productTypes.toArray().first() as ProductType
            while (productType) {
                AccountFilter.findAllByProductType(productType).each { accountFilter ->
                    if (accountFilter.account.type == 'real' &&
                            accountFilter.account.hasOnlinePayment)
                        if (!accountsForOnlinePayment.any { account ->
                            account.id == accountFilter.account.id
                        } && (!accountFilter.brands
                                || accountFilter?.brands?.isEmpty()
                                || accountFilter?.brands?.any { it.id == orderItem?.productModel?.product?.brand?.id }))
                            accountsForOnlinePayment.add(accountFilter.account)
                }

                productType = productType.parentProduct
            }
        }

        accountsForOnlinePayment.addAll(
                Account.findAllByBankNameNotInListAndType(accountsForOnlinePayment.collect { it.bankName } ?: [''], 'legal'))

        accountsForOnlinePayment.addAll(
                Account.findAllByBankNameNotInList(accountsForOnlinePayment.collect { it.bankName } ?: ['']))

        accountsForOnlinePayment.unique { it.bankName }

        [
                orderPrice: order.totalPrice,
                accountsForOnlinePayment: accountsForOnlinePayment,
                accounts: Account.findAllByType('legal'),
                customerAccountValue: accountingService.calculateCustomerAccountValue(springSecurityService.currentUser)
        ]
    }

    def onlinePayment() {
        if (params.accountId) {
            def order = Order.get(params.order.id)
            def account = Account.get(params.accountId)
            def model = [bankName: account.bankName]
            switch (account.bankName) {
                case 'mellat':

                    def onlinePayment = new OnlinePayment()
                    onlinePayment.account = account
                    onlinePayment.amount = params["value"].toInteger()
                    onlinePayment.customer = order.customer
                    onlinePayment.date = new Date()
                    onlinePayment.order = order
                    onlinePayment.usingCustomerAccountValueAllowed = params.usingCustomerAccountValueAllowed
                    onlinePayment.save()

                    def result = mellatService.prepareForPayment(account, onlinePayment.id, params.value, order.customerId)
                    if (result[0] == "0")
                        model.refId = result[1]
                    else
                        flash.message = result[0]

                    onlinePayment.initialResultCode = result[0] ?: null
                    if (result.size() > 1)
                        onlinePayment.referenceId = result[1]
                    onlinePayment.save()

                    break
                case 'saman':
                    break
            }

            model
        }
    }

    def onlinePaymentResultMellat() {

        def model = [:]
        def onlinePayment = OnlinePayment.findByReferenceId(params.RefId.toString())
        if (onlinePayment) {
            onlinePayment.resultCode = params.ResCode.toString()
            onlinePayment.transactionReferenceCode = params.SaleReferenceId.toString()
            onlinePayment.save()
            model = [onlinePayment: onlinePayment]
            if (onlinePayment.resultCode == "0") {
                def verificationResult = mellatService.verifyPayment(onlinePayment.account, onlinePayment.order.id, params.SaleOrderId, onlinePayment.transactionReferenceCode)
                onlinePayment.resultCode = "${onlinePayment.resultCode}-${verificationResult}"
                onlinePayment.save()
                model.verificationResult = verificationResult
                if (verificationResult == "0") {
                    def settleResult = mellatService.settlePayment(onlinePayment.account, onlinePayment.order.id, params.SaleOrderId, onlinePayment.transactionReferenceCode)
                    onlinePayment.resultCode = "${onlinePayment.resultCode}-${settleResult}"
                    onlinePayment.save()
                    if (settleResult == "0" || settleResult == "45")
                        payOrder(onlinePayment, model)
                }
            }
        }

        render view: 'onlinePaymentResult', model: model
    }

    def payOrder(OnlinePayment payment, model) {
        //add customer transaction
        def customerTransaction = new CustomerTransaction()
        customerTransaction.account = payment.account
        customerTransaction.value = payment.amount
        customerTransaction.date = new Date()
        customerTransaction.type = AccountingHelper.TRANSACTION_TYPE_DEPOSIT
        customerTransaction.order = payment.order
        customerTransaction.creator = payment.customer
        customerTransaction.save()

        //add transaction
        def transaction = new Transaction()
        transaction.account = payment.account
        transaction.value = payment.amount
        transaction.date = new Date()
        transaction.type = AccountingHelper.TRANSACTION_TYPE_DEPOSIT
        transaction.order = payment.order
        transaction.creator = payment.customer
        transaction.save()

        //pay order
        if (payment.order) {

            def orderPrice = payment.order.totalPrice
            def customerAccount = accountingService.calculateCustomerAccountValue(payment.customer)
            def payableAmount = payment.usingCustomerAccountValueAllowed ? payment.amount + customerAccount : payment.amount

            if (payableAmount >= orderPrice) {
                //save withdrawal customer transaction
                customerTransaction = new CustomerTransaction()
                customerTransaction.value = orderPrice
                customerTransaction.date = new Date()
                customerTransaction.type = AccountingHelper.TRANSACTION_TYPE_WITHDRAWAL
                customerTransaction.order = payment.order
                customerTransaction.creator = payment.customer
                customerTransaction.save()

                //save withdrawal transaction
                transaction = new Transaction()
                transaction.value = orderPrice
                transaction.date = new Date()
                transaction.type = AccountingHelper.TRANSACTION_TYPE_WITHDRAWAL
                transaction.order = payment.order
                transaction.creator = payment.customer
                transaction.save()

                //set order status
                payment.order.status = OrderHelper.STATUS_PAID
                payment.order.save()

                //save order tracking log
                def trackingLog = new OrderTrackingLog()
                trackingLog.action = OrderHelper.ACTION_PAYMENT
                trackingLog.date = new Date()
                trackingLog.order = payment.order
                trackingLog.user = payment.customer
                trackingLog.title = "order.actions.${OrderHelper.ACTION_PAYMENT}"
                if (!trackingLog.validate() || !trackingLog.save()) {
                    //tracking log save error
                    return
                }

                //send alert to customer
                mailService.sendMail {
                    to springSecurityService.currentUser.email
                    subject message(code: 'order.paid.subject')
                    html(view: "/messageTemplates/mail/orderPaid",
                            model: [customer: springSecurityService.currentUser, order: payment.order])
                }

                if (springSecurityService.currentUser.mobile)
                    messageService.sendMessage(
                            springSecurityService.currentUser.mobile,
                            g.render(
                                    template: '/messageTemplates/sms/orderPaid',
                                    model: [customer: springSecurityService.currentUser, order: payment.order]).toString())

                model.orderPaid = true
            } else {
                //send alert to customer
                mailService.sendMail {
                    to springSecurityService.currentUser.email
                    subject message(code: 'order.notPaid.subject')
                    html(view: "/messageTemplates/mail/orderNotPaid",
                            model: [customer: springSecurityService.currentUser, order: payment.order])
                }

                if (springSecurityService.currentUser.mobile)
                    messageService.sendMessage(
                            springSecurityService.currentUser.mobile,
                            g.render(
                                    template: '/messageTemplates/sms/orderNotPaid',
                                    model: [customer: springSecurityService.currentUser, order: payment.order]).toString())

                model.orderPaid = false
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
