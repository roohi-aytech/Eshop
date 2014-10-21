package eshop.delivery

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class DeliveryMethodController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def deliveryMethodInstance
        if (params.id)
            deliveryMethodInstance = DeliveryMethod.get(params.id)
        else
            deliveryMethodInstance = new DeliveryMethod()
        render(template: "form", model: [deliveryMethodInstance: deliveryMethodInstance])
    }

    def list() {
    }

    def save() {
        def deliveryMethodInstance
        if (params.id) {
            deliveryMethodInstance = DeliveryMethod.get(params.id)
            deliveryMethodInstance.properties = params
        } else {
            deliveryMethodInstance = new DeliveryMethod(params)
        }
        deliveryMethodInstance.minIntervalFromOrder=params.int('minIntervalFromOrder')
        if (deliveryMethodInstance.validate() && deliveryMethodInstance.save()) {
            render deliveryMethodInstance as JSON
        } else
            render(template: "form", model: [deliveryMethodInstance: deliveryMethodInstance])
    }


    def delete() {
        def deliveryMethodInstance = DeliveryMethod.get(params.id)
        deliveryMethodInstance.deleted = true
        deliveryMethodInstance.save()
        render 0
    }

    def getImage() {

        def deliveryMethodInstance = DeliveryMethod.get(params.id)
        if (deliveryMethodInstance) {
            response.addHeader("content-disposition", "attachment;")
            response.contentLength = deliveryMethodInstance.logo.length
            response.outputStream << deliveryMethodInstance.logo

        } else {
            response.contentLength = 0
            response.outputStream << []
        }

    }
}
