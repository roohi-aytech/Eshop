package eshop.accounting

import eshop.AccountingHelper
import eshop.OrderHelper
import eshop.OrderTrackingLog

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

                return // next parts are not required anymore

                //pay order
//                if (request.order) {
//                    def orderPrice = request.order.totalPrice
//                    def customerAccount = request.owner ? accountingService.calculateCustomerAccountValue(request.owner) : 0
//                    def payableAmount = request.usingCustomerAccountValueAllowed ? request.value + customerAccount : request.value
//
//                    if (payableAmount >= orderPrice) {
//                        //save withdrawal customer transaction
//                        customerTransaction = new CustomerTransaction()
//                        customerTransaction.value = orderPrice
//                        customerTransaction.date = new Date()
//                        customerTransaction.type = AccountingHelper.TRANSACTION_TYPE_WITHDRAWAL
//                        customerTransaction.order = request.order
//                        customerTransaction.creator = request.owner
//                        customerTransaction.save()
//
//                        //save withdrawal transaction
//                        transaction = new Transaction()
//                        transaction.value = orderPrice
//                        transaction.date = new Date()
//                        transaction.type = AccountingHelper.TRANSACTION_TYPE_WITHDRAWAL
//                        transaction.order = request.order
//                        transaction.creator = request.owner
//                        transaction.save()
//
//                        //set order status
//                        request.order.status = OrderHelper.STATUS_PAID
//                        request.order.save()
//
//                        //save order tracking log
//                        def trackingLog = new OrderTrackingLog()
//                        trackingLog.action = OrderHelper.ACTION_COMPLETION
//                        trackingLog.date = new Date()
//                        trackingLog.order = request.order
//                        trackingLog.user = request.owner
//                        trackingLog.title = "order.actions.${OrderHelper.ACTION_COMPLETION}"
//                        if (!trackingLog.validate() || !trackingLog.save()) {
//                            //tracking log save error
//                            return
//                        }
//
//                        //send alert to customer
//                        mailService.sendMail {
//                            to request.owner ? request.owner.email : request.order.ownerEmail
//                            subject message(code: 'order.paid.subject')
//                            html(view: "/messageTemplates/mail/orderPaid",
//                                    model: [customerName: request.owner ? request.owner.toString() : request.order.ownerName, order: request.order])
//                        }
//
//                        if (request.owner ? request.owner.mobile : request.order.ownerMobile)
//                            messageService.sendMessage(
//                                    request.owner ? request.owner.mobile : request.order.ownerMobile,
//                                    g.render(
//                                            template: '/messageTemplates/sms/orderPaid',
//                                            model: [customerName: request.owner ? request.owner.toString() : request.order.ownerName, order: request.order]).toString())
//                    } else {
//                        //send alert to customer
//                        mailService.sendMail {
//                            to request.owner ? request.owner.email : request.order.ownerEmail
//                            subject message(code: 'order.notPaid.subject')
//                            html(view: "/messageTemplates/mail/orderNotPaid",
//                                    model: [customerName: request.owner ? request.owner.toString() : request.order.ownerName, order: request.order])
//                        }
//
//                        if (request.owner ? request.owner.mobile : request.order.ownerMobile)
//                            messageService.sendMessage(
//                                    request.owner ? request.owner.mobile : request.order.ownerMobile,
//                                    g.render(
//                                            template: '/messageTemplates/sms/orderNotPaid',
//                                            model: [customerName: request.owner ? request.owner.toString() : request.order.ownerName, order: request.order]).toString())
//                    }
//                }

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
