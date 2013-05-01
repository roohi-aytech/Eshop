package eshop

import grails.converters.JSON

class ProducerVariationsController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def deleteProducerVariations() {
        def producer = ProducerVariations.get(params.id)
        producer.delete(flush: true)
        render 0
    }

    def save(){
        def producerInstance
        if (params.id) {
            producerInstance = ProducerVariations.get(params.id)
            producerInstance.properties = params
        }
        else {
            producerInstance = new ProducerVariations(params)

        }


        if (producerInstance.validate() && producerInstance.save()) {
            render producerInstance as JSON
        }
        else
            render(template: "form", model: [producerInstance: producerInstance])

    }

    def form(){
        def producerVariationsInstance
        def product

        if (params.id)
            producerVariationsInstance = ProducerVariations.findById(params.id)
        else
            producerVariationsInstance = new ProducerVariations()

        if(params.product.id)
            product = Product.get(params.product.id)

        render(template: "form", model: [producerVariationsInstance: producerVariationsInstance, product: product])
    }

}
