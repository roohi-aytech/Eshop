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
            slideInstance.properties = params
            def image = slideInstance.image
            if(!params.image)
                slideInstance.image = image
        } else {
            slideInstance = new Slide(params)
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


}
