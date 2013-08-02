package eshop.accounting

import eshop.accounting.PaymentRequest
import grails.converters.JSON

class PaymentRequestController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def paymentRequestInstance
        if (params.id)
            paymentRequestInstance = PaymentRequest.get(params.id)
        else
            paymentRequestInstance = new PaymentRequest()
        render(template: "form", model: [paymentRequestInstance: paymentRequestInstance])
    }

    def list() {
    }

    def show(){
        [paymentRequestInstance:PaymentRequest.get(params.id)]
    }

    def save() {
        def paymentRequestInstance
        if (params.id) {
            paymentRequestInstance = PaymentRequest.get(params.id)
            paymentRequestInstance.properties = params
        } else
            paymentRequestInstance = new PaymentRequest(params)
        if (paymentRequestInstance.validate() && paymentRequestInstance.save()) {
            render paymentRequestInstance as JSON
        } else
            render(template: "form", model: [paymentRequestInstance: paymentRequestInstance])
    }


    def delete() {
        def paymentRequestInstance = PaymentRequest.get(params.id)
        paymentRequestInstance.delete(flush: true)
        render 0
    }
}
