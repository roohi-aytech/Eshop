package eshop

import eshop.Producer
import eshop.ProducingProduct
import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class ProducerController {

//    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }
    def show() {
        def producerInstance = Producer.get(params.id)
        if (!producerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'producer.label', default: 'Producer'), id])
            redirect(action: "list")
            return
        }

      [producerInstance: producerInstance]
    }


    def showProducingProduct(){
        def producingProductInstance = ProducingProduct.get(params.id)
        if (!producingProductInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'producingProducts.label', default: 'producingProducts'), id])
            redirect(action: "list")
            return
        }

        [producingProductInstance: producingProductInstance]
    }

    def form(){
        def producerInstance
        if(params.id)
            producerInstance = Producer.get(params.id)
        else
            producerInstance = new Producer()

        render(template: "form", model: [producerInstance: producerInstance])
    }

    def list() {
    }

    def save() {
        def producerInstance
        if(params.id){
            producerInstance = Producer.get(params.id)
            producerInstance.properties = params
        }
        else
            producerInstance = new Producer(params)
        if(producerInstance.validate() && producerInstance.save()){
            render producerInstance as JSON
        }
        else
              render producerInstance.errors.toString()
            //render(template: "form", model: [producerInstance: producerInstance])
    }

    def delete() {
        def producerInstance = Producer.get(params.id)
        producerInstance.delete(flush: true)
        render 0
    }

    def details() {
        def producerInstance = Producer.get(params.id)

        [producerInstance: producerInstance]
    }
}
