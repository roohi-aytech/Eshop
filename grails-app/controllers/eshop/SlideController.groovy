package eshop

import grails.converters.JSON
import org.codehaus.groovy.grails.commons.DefaultGrailsDomainClass

class SlideController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def slideInstance
        if (params.id)
            slideInstance = Slide.get(params.id)
        else
            slideInstance = new Slide()
        render(template: "form", model: [slideInstance: slideInstance])
    }

    def list() {
    }

    def save() {
        def slideInstance
        if (params.id) {
            slideInstance = Slide.get(params.id)
            def image1024 = slideInstance.image1024
            def image1280 = slideInstance.image1280
            def image1440 = slideInstance.image1440
            slideInstance.properties = params
            if(!params.image1024)
                slideInstance.image1024 = image1024
            if(!params.image1280)
                slideInstance.image1280 = image1280
            if(!params.image1440)
                slideInstance.image1440 = image1440
            slideInstance.image = []
        } else {
            slideInstance = new Slide(params)
            slideInstance.image = []
        }
        if (slideInstance.validate() && slideInstance.save()) {
            render slideInstance as JSON
        } else
            render(template: "form", model: [slideInstance: slideInstance])
    }


    def delete() {
        def slideInstance = Slide.get(params.id)
        slideInstance.deleted = true
        slideInstance.save()
        render 0
    }

    def getImage() {
        def slide = Slide.get(params.id)
        if (slide) {
            response.addHeader("content-disposition", "attachment;")
            switch (params.size) {
                case "1024":
                    response.contentLength = slide.image1024.length
                    response.outputStream << slide.image1024
                    break;
                case "1280":
                    response.contentLength = slide.image1280.length
                    response.outputStream << slide.image1280
                    break;
                case "1440":
                    response.contentLength = slide.image1440.length
                    response.outputStream << slide.image1440
                    break;
                default:
                    response.contentLength = 0
                    response.outputStream << []
            }

        } else {
            response.contentLength = 0
            response.outputStream << []
        }

    }


}
