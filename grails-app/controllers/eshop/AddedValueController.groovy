package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class AddedValueController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def addedValueInstance
        if (params.id)
            addedValueInstance = AddedValue.get(params.id)
        else
            addedValueInstance = new AddedValue(params)
        render(template: "form", model: [addedValueInstance: addedValueInstance])
    }

    def variation() {
        def baseProductInstance = BaseProduct.get(params.baseProduct.id)
        def variations = baseProductInstance.variations
        render(template: "variation", model: [variations: variations])
    }

    def variationValue() {
        def variation = Variation.get(params.variation)
        if (variation) {
            def values = variation.variationValues
            render(template: "variation_values", model: [variationValues: values])
        }
        else
            render ""
    }

    def list() {
    }

    def save() {
        def addedValueInstance
        if (params.id) {
            addedValueInstance = AddedValue.get(params.id)
            addedValueInstance.properties = params
        }
        else
            addedValueInstance = new AddedValue(params)
        if (addedValueInstance.validate() && addedValueInstance.save()) {
            render addedValueInstance as JSON
        }
        else
            render(template: "form", model: [addedValueInstance: addedValueInstance])
    }


    def delete() {
        def addedValueInstance = AddedValue.get(params.id)
        addedValueInstance.delete(flush: true)
        render 0
    }
}
