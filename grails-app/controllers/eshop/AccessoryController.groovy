package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class AccessoryController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def accessoryInstance
        if (params.id)
            accessoryInstance = Accessory.get(params.id)
        else
            accessoryInstance = new Accessory(params)
        render(template: "form", model: [accessoryInstance: accessoryInstance])
    }

    def list() {
    }

    def save() {

    }

    def delete() {

    }

    def mappingAttributes(){
        ProductType productType
        ProductType accessory
        def sAttribute = productType.getAttributeTypes()
        def dAttribute = accessory.getAttributeTypes()



    }
}
