package eshop

import grails.converters.JSON

class ProvinceController {

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
        slideInstance.delete(flush: true)
        render 0
    }
}
