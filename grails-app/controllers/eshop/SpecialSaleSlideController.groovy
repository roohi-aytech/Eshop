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



    def getImage() {
        def specialSaleSlide = SpecialSaleSlide.get(params.id)
        if (specialSaleSlide){
            response.addHeader("content-disposition", "attachment;")
            switch(params.size){
                case "1024":
                    response.contentLength = specialSaleSlide.image1024.length
                    response.outputStream << specialSaleSlide.image1024
                    break;
                case "1280":
                    response.contentLength = specialSaleSlide.image1280.length
                    response.outputStream << specialSaleSlide.image1280
                    break;
                case "1440":
                    response.contentLength = specialSaleSlide.image1440.length
                    response.outputStream << specialSaleSlide.image1440
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
