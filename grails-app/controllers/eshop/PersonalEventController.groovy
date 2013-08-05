package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class PersonalEventController {

    def springSecurityService

    static allowedMethods = [save: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def personalEventInstance
        if (params.id)
            personalEventInstance = PersonalEvent.get(params.id)
        else
            personalEventInstance = new PersonalEvent()
        render(template: "form", model: [personalEventInstance: personalEventInstance])
    }

    def list() {
    }

    def save() {
        def personalEventInstance
        if (params.id) {
            personalEventInstance = PersonalEvent.get(params.id)
            personalEventInstance.properties = params
        } else
            personalEventInstance = new PersonalEvent(params)

        personalEventInstance.customer = springSecurityService.currentUser as Customer

        if (personalEventInstance.validate() && personalEventInstance.save()) {
//            render personalEventInstance as JSON
            redirect(controller: 'customer', action: 'profile', params: [tab:'personalEvents'])
        } else
            render(template: "form", model: [personalEventInstance: personalEventInstance])
    }


    def delete() {
        def personalEventInstance = PersonalEvent.get(params.id)
        personalEventInstance.delete(flush: true)
        redirect(controller: 'customer', action: 'personalEvents')
    }

    def create(){
        def instance = PersonalEvent.newInstance()
        instance.date = new Date()
        [personalEventInstance: instance]
    }

    def edit(){
        [personalEventInstance: PersonalEvent.get(params.id)]
    }
}
