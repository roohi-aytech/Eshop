package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class CultureEventController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def cultureEventInstance
        if (params.id)
            cultureEventInstance = CultureEvent.get(params.id)
        else
            cultureEventInstance = new CultureEvent()
        render(template: "form", model: [cultureEventInstance: cultureEventInstance])
    }

    def list() {
    }

    def save() {
        def cultureEventInstance
        if (params.id) {
            cultureEventInstance = CultureEvent.get(params.id)
            cultureEventInstance.properties = params
        }
        else
            cultureEventInstance = new CultureEvent(params)
        if (cultureEventInstance.validate() && cultureEventInstance.save()) {
            render cultureEventInstance as JSON
        }
        else
            render(template: "form", model: [cultureEventInstance: cultureEventInstance])
    }


    def delete() {
        def cultureEventInstance = CultureEvent.get(params.id)
        cultureEventInstance.delete(flush: true)
        render 0
    }
}
