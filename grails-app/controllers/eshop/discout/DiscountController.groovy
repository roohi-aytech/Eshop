package eshop.discout

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class DiscountController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form(){
        def discountInstance
        if(params.id)
            discountInstance = Discount.get(params.id)
        else
            discountInstance = new Discount()
        render(template: "form", model: [discountInstance: discountInstance])
    }

    def list() {
    }

    def save() {
        def discountInstance
        if(params.id){
            discountInstance = Discount.get(params.id)
            discountInstance.properties = params
        }
        else
            discountInstance = new Discount(params)
        if(discountInstance.validate() && discountInstance.save()){
            render discountInstance as JSON
        }
        else
            render(template: "form", model: [discountInstance: discountInstance])
    }


    def delete() {
        def discountInstance = Discount.get(params.id)
        discountInstance.delete(flush: true)
        render 0
    }
}
