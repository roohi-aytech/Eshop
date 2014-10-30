package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class RelationshipController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def relationshipInstance
        if (params.id)
            relationshipInstance = Relationship.get(params.id)
        else
            relationshipInstance = new Relationship()
        render(template: "form", model: [relationshipInstance: relationshipInstance])
    }

    def list() {
    }

    def save() {
        def relationshipInstance
        if (params.id) {
            relationshipInstance = Relationship.get(params.id)
            relationshipInstance.properties = params
        } else
            relationshipInstance = new Relationship(params)
        if (relationshipInstance.validate() && relationshipInstance.save()) {
            render relationshipInstance as JSON
        } else
            render(template: "form", model: [relationshipInstance: relationshipInstance])
    }


    def delete() {
        def relationshipInstance = Relationship.get(params.id)
        relationshipInstance.deleted = true
        relationshipInstance.save(flush: true)
        render 0
    }

    def getSex(){
        render Relationship.get(params.id).sex
    }
}
