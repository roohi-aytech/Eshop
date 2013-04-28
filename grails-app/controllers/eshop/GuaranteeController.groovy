package eshop

import eshop.Producer
import eshop.ProducingProduct
import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class GuaranteeController {

//    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }



    def form(){
        def guaranteeInstance
        if(params.id)
            guaranteeInstance = Guarantee.get(params.id)
        else
            guaranteeInstance = new Guarantee()

        render(template: "form", model: [guaranteeInstance: guaranteeInstance])
    }

    def list() {

    }

    def save() {
        def guaranteeInstance
        if(params.id){
            guaranteeInstance = Guarantee.get(params.id)
            guaranteeInstance.properties = params
        }
        else
            guaranteeInstance = new Guarantee(params)
        if(guaranteeInstance.validate() && guaranteeInstance.save()){
            render guaranteeInstance as JSON
        }
        else
            render(template: "form", model: [guaranteeInstance: guaranteeInstance])
    }

    def delete() {
        def guaranteeInstance = Producer.get(params.id)
        guaranteeInstance.delete(flush: true)
        render 0
    }


}
