package eshop

import eshop.accounting.CustomerTransaction
import eshop.accounting.Transaction
import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class PaymentResponseController {

    def springSecurityService
    def priceService
    def accountingService
    def mailService
    def messageService

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def create() {

    }

    def form() {
        def paymentResponseInstance
        if (params.id)
            paymentResponseInstance = PaymentResponse.get(params.id)
        else
            paymentResponseInstance = new PaymentResponse()
        render(template: "form", model: [paymentResponseInstance: paymentResponseInstance])
    }

    def list() {
    }

    def save() {
        def paymentResponseInstance
        def request = PaymentRequest.get(params.request.id)
        if (params.id) {
            paymentResponseInstance = PaymentResponse.get(params.id)
            paymentResponseInstance.properties = params

        } else {
            paymentResponseInstance = new PaymentResponse(params)
            paymentResponseInstance.owner = springSecurityService.currentUser
            paymentResponseInstance.creationDate = new Date()
            paymentResponseInstance.request = request
            paymentResponseInstance.indx = request.responses.count { it }
        }
        if (paymentResponseInstance.validate() && paymentResponseInstance.save()) {
            request.responses.add(paymentResponseInstance)
            request.save()

            if (params.approved) {

                //add customer transaction
                def customerTransaction = new CustomerTransaction()
                customerTransaction.account = request.account
                customerTransaction.value = request.value
                customerTransaction.date = new Date()
                customerTransaction.type = AccountingHelper.TRANSACTION_TYPE_DEPOSIT
                customerTransaction.order = request.order
                customerTransaction.creator = request.owner
                customerTransaction.save()

                //add transaction
                def transaction = new Transaction()
                transaction.account = request.account
                transaction.value = request.value
                transaction.date = new Date()
                transaction.type = AccountingHelper.TRANSACTION_TYPE_DEPOSIT
                transaction.order = request.order
                transaction.creator = request.owner
                transaction.save()

                //pay order
                if (request.order) {
                    def orderPrice = request.order.totalPrice
                    def customerAccount = accountingService.calculateCustomerAccountValue(request.owner)
                    def payableAmount = request.usingCustomerAccountValueAllowed ? request.value + customerAccount : request.value

                    if (payableAmount >= orderPrice) {
                        //save withdrawal customer transaction
                        customerTransaction = new CustomerTransaction()
                        customerTransaction.value = orderPrice
                        customerTransaction.date = new Date()
                        customerTransaction.type = AccountingHelper.TRANSACTION_TYPE_WITHDRAWAL
                        customerTransaction.order = request.order
                        customerTransaction.creator = request.owner
                        customerTransaction.save()

                        //save withdrawal transaction
                        transaction = new Transaction()
                        transaction.value = orderPrice
                        transaction.date = new Date()
                        transaction.type = AccountingHelper.TRANSACTION_TYPE_WITHDRAWAL
                        transaction.order = request.order
                        transaction.creator = request.owner
                        transaction.save()

                        //set order status
                        request.order.status = OrderHelper.STATUS_PAID
                        request.order.save()

                        //save order tracking log
                        def trackingLog = new OrderTrackingLog()
                        trackingLog.action = OrderHelper.ACTION_PAYMENT
                        trackingLog.date = new Date()
                        trackingLog.order = request.order
                        trackingLog.user = request.owner
                        trackingLog.title = "order.actions.${OrderHelper.ACTION_PAYMENT}"
                        if (!trackingLog.validate() || !trackingLog.save()) {
                            //tracking log save error
                            return
                        }

                        //send alert to customer
                        mailService.sendMail {
                            to springSecurityService.currentUser.email
                            subject message(code: 'activationMail.subject')
                            html(view: "/messageTemplates/mail/orderPaid",
                                    model: [customer: springSecurityService.currentUser, order: request.order])
                        }

                        if (springSecurityService.currentUser.mobile)
                            messageService.sendMessage(
                                    springSecurityService.currentUser.mobile,
                                    g.render(
                                            template: '/messageTemplates/sms/orderPaid',
                                            model: [customer: springSecurityService.currentUser, order: request.order]).toString())
                    } else {
                        //send alert to customer
                        mailService.sendMail {
                            to springSecurityService.currentUser.email
                            subject message(code: 'activationMail.subject')
                            html(view: "/messageTemplates/mail/orderNotPaid",
                                    model: [customer: springSecurityService.currentUser, order: request.order])
                        }

                        if (springSecurityService.currentUser.mobile)
                            messageService.sendMessage(
                                    springSecurityService.currentUser.mobile,
                                    g.render(
                                            template: '/messageTemplates/sms/orderNotPaid',
                                            model: [customer: springSecurityService.currentUser, order: request.order]).toString())
                    }
                }

            }

            redirect(controller: 'paymentRequest', action: 'show', params: [id: params.request.id])
        } else
            render(template: "form", model: [paymentResponseInstance: paymentResponseInstance])
    }



    def delete() {
        def paymentResponseInstance = PaymentResponse.get(params.id)
        paymentResponseInstance.delete(flush: true)
        render 0
    }
}
