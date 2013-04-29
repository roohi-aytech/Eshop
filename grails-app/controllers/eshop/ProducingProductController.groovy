package eshop

import eshop.Producer
import eshop.ProducingProduct
import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class producingProductController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }


    def form(){
        def producingProductInstance
        if(params.id)
            producingProductInstance = ProducingProduct.get(params.id)
        else
            producingProductInstance = new ProducingProduct()

        render(template: "form", model: [producingProductInstance: producingProductInstance, producerId: params.producerId])
    }

    def list() {
    }

    def save() {
        def producingProductInstance
        if(params.id){
            producingProductInstance = ProducingProduct.get(params.id)
            producingProductInstance.properties = params
        }
        else
            producingProductInstance = new ProducingProduct(params)
        if(producingProductInstance.validate() && producingProductInstance.save()){
            render producingProductInstance as JSON
        }
        else
            render(template: "form", model: [producerInstance: producingProductInstance])
    }

    def delete() {
        def producingProductInstance = ProducingProduct.get(params.id)
        producingProductInstance.delete(flush: true)
        render 0
    }
}