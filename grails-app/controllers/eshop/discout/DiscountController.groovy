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



    def getImage() {
        def discount = Disount.get(params.id)
        if (discount){
            response.addHeader("content-disposition", "attachment;")
            switch(params.size){
                case "1024":
                    response.contentLength = discount.image1024.length
                    response.outputStream << discount.image1024
                    break;
                case "1280":
                    response.contentLength = discount.image1280.length
                    response.outputStream << discount.image1280
                    break;
                case "1440":
                    response.contentLength = discount.image1440.length
                    response.outputStream << discount.image1440
                    break;
                default:
                    response.contentLength = 0
                    response.outputStream << []
            }

        }
        else {
            response.contentLength = 0
            response.outputStream << []
        }

    }
}
