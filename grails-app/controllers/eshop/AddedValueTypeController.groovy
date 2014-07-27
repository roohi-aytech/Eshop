package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class AddedValueTypeController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def addedValueTypeInstance
        if (params.id)
            addedValueTypeInstance = AddedValueType.get(params.id)
        else
            addedValueTypeInstance = new AddedValueType()
        render(template: "form", model: [addedValueTypeInstance: addedValueTypeInstance])
    }

    def list() {
    }

    def save() {
        def addedValueTypeInstance
        if (params.id) {
            addedValueTypeInstance = AddedValueType.get(params.id)
            addedValueTypeInstance.properties = params
        } else
            addedValueTypeInstance = new AddedValueType(params)
        if (params.imageFile) {
            if (!addedValueTypeInstance.image)
                addedValueTypeInstance.image = new Content(contentType: 'image', name: addedValueTypeInstance.title)
            addedValueTypeInstance.image.fileContent = params.imageFile.bytes
            addedValueTypeInstance.image.save()
        }
        if (addedValueTypeInstance.validate() && addedValueTypeInstance.save()) {
            render addedValueTypeInstance as JSON
        } else
            render(template: "form", model: [addedValueTypeInstance: addedValueTypeInstance])
    }


    def delete() {
        def addedValueTypeInstance = AddedValueType.get(params.id)
        addedValueTypeInstance.delete(flush: true)
        render 0
    }
}
