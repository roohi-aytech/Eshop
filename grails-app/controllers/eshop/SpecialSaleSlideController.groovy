package eshop

import grails.converters.deep.JSON

class SpecialSaleSlideController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form(){
        def specialSaleSlideInstance
        if(params.id)
            specialSaleSlideInstance = SpecialSaleSlide.get(params.id)
        else
            specialSaleSlideInstance = new SpecialSaleSlide()
        render(template: "form", model: [specialSaleSlideInstance: specialSaleSlideInstance])
    }

    def list() {
    }

    def save() {
        def specialSaleSlideInstance
        if(params.id){
            specialSaleSlideInstance = SpecialSaleSlide.get(params.id)
            specialSaleSlideInstance.properties = params
        }
        else
            specialSaleSlideInstance = new SpecialSaleSlide(params)
        if(specialSaleSlideInstance.validate() && specialSaleSlideInstance.save()){
            render specialSaleSlideInstance as JSON
        }
        else
            render(template: "form", model: [specialSaleSlideInstance: specialSaleSlideInstance])
    }


    def delete() {
        def specialSaleSlideInstance = SpecialSaleSlide.get(params.id)
        specialSaleSlideInstance.delete(flush: true)
        render 0
    }
}
