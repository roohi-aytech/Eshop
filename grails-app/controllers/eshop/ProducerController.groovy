package eshop.discout

import eshop.Producer
import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class ProducerController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
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
            render(template: "form", model: [producerInstance: producerInstance])
    }

    def delete() {
        def producerInstance = Producer.get(params.id)
        producerInstance.delete(flush: true)
        render 0
    }
}
