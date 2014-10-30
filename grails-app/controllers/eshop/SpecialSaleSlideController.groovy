package eshop

import grails.converters.deep.JSON

class SpecialSaleSlideController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def specialSaleSlideInstance
        if (params.id)
            specialSaleSlideInstance = SpecialSaleSlide.get(params.id)
        else
            specialSaleSlideInstance = new SpecialSaleSlide(params)
        render(template: "form", model: [specialSaleSlideInstance: specialSaleSlideInstance])
    }

    def list() {
    }

    def save() {
        def slideSaleInstance
        if (params.id) {
            slideSaleInstance = SpecialSaleSlide.get(params.id)
            def image = slideSaleInstance.image
            def extraImage1 = slideSaleInstance.extraImage1
            def extraImage2 = slideSaleInstance.extraImage2
            def extraImage3 = slideSaleInstance.extraImage3
            def mobileImage = slideSaleInstance.mobileImage
            slideSaleInstance.properties = params
            if (!params.image)
                slideSaleInstance.image = image
            if (!params.extraImage1)
                slideSaleInstance.extraImage1 = extraImage1
            if (!params.extraImage2)
                slideSaleInstance.extraImage2 = extraImage2
            if (!params.extraImage3)
                slideSaleInstance.extraImage3 = extraImage3
            if (!params.mobileImage)
                slideSaleInstance.mobileImage = mobileImage
        } else {
            slideSaleInstance = new SpecialSaleSlide(params)
        }
        if (slideSaleInstance.validate() && slideSaleInstance.save()) {
            render slideSaleInstance as grails.converters.JSON
        } else
            render(template: "form", model: [slideInstance: slideSaleInstance, specialSaleSlideInstance: slideSaleInstance])
    }


    def delete() {
        def specialSaleSlideInstance = SpecialSaleSlide.get(params.id)
        specialSaleSlideInstance.delete(flush: true)
        render 0
    }
}
