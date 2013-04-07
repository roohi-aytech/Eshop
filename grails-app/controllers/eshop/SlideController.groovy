package eshop

import grails.converters.JSON

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
            slideInstance.properties = params
        } else
            slideInstance = new Slide(params)
        if (slideInstance.validate() && slideInstance.save()) {
            render slideInstance as JSON
        } else
            render(template: "form", model: [slideInstance: slideInstance])
    }


    def delete() {
        def slideInstance = Slide.get(params.id)
        slideInstance.delete(flush: true)
        render 0
    }

    def getImage() {
        def slide = Slide.get(params.id)
        if (slide && slide.image) {
            response.addHeader("content-disposition", "attachment;")
            response.contentLength = slide.image.length
            response.outputStream << slide.image
        }
        else {
            response.contentLength = 0
            response.outputStream << []
        }

    }
}
