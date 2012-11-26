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
        def variations
        def variationValue
        def variation
        if (params.addedValueId) {
            def addedValueInstance = AddedValue.get(params.addedValueId)
            variations = collectVariations(addedValueInstance?.baseProduct)
            variationValue = VariationValue.get(params.variationValueId)
            variation = addedValueInstance?.baseProduct?.variations?.find {it.variationValues.contains(variationValue)}
        }
        else {
            def baseProductInstance = BaseProduct.get(params.baseProduct.id)
            variations = collectVariations(baseProductInstance)
        }
        def model = [variations: variations, variationValue: variationValue,
                variation: variation]

        render(template: "variation", model: model)
    }

    private def collectVariations(baseProduct) {
        def variations = baseProduct.variations
        if (baseProduct instanceof Product) {
            baseProduct.productTypes.each {
                variations.addAll(collectVariations(it))
            }
        }
        else if(baseProduct instanceof ProductType){
            if (baseProduct.parentProduct)
                variations.addAll(collectVariations(baseProduct.parentProduct))
        }
        return variations
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
