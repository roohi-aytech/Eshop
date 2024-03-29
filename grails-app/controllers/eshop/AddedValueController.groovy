package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class AddedValueController {

//    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def addedValueInstance
        if (params.id)
            addedValueInstance = AddedValue.get(params.id)
        else
            addedValueInstance = new AddedValue(params)
        render(template: "form", model: [addedValueInstance: addedValueInstance, showBrand: addedValueInstance.baseProduct instanceof ProductType])
    }

    def variation() {
        def variations
        def variationValue
        def variation
        if (params.addedValueId) {
            def addedValueInstance = AddedValue.get(params.addedValueId)
            variations = collectVariations(addedValueInstance?.baseProduct)
            variationValue = VariationValue.get(params.variationValueId)
            variation = addedValueInstance?.baseProduct?.variations?.find {
                it?.variationValues?.id?.contains(variationValue?.id)
            }
        } else {
            def baseProductInstance = BaseProduct.get(params.baseProduct.id)
            variations = collectVariations(baseProductInstance)
        }
        def model = [variations: variations, variationValue: variationValue,
                     variation : variation]

        render(template: "variation", model: model)
    }

    private def collectVariations(baseProduct) {
        def variations = []
        baseProduct.variations.each() { variation ->
            if (!variations.any { it.variationGroup == variation.variationGroup })
                variations.add(variation)
        }
//        if (baseProduct instanceof Product) {
//            baseProduct.productTypes.each {
//                collectVariations(it).each { variation ->
//                    if (!variations.any { it.variationGroup == variation.variationGroup })
//                        variations.add(variation)
//                }
//            }
//        } else if (baseProduct instanceof ProductType) {
//            if (baseProduct.parentProduct)
//                collectVariations(baseProduct.parentProduct).each { variation ->
//                    if (!variations.any { it.variationGroup == variation.variationGroup })
//                        variations.add(variation)
//                }
//        }
        return variations
    }

    def variationValue() {
        def variation = Variation.get(params.variation)
        if (variation) {
            def values = collectVariationValues(variation.baseProduct, variation.variationGroup)
            render(template: "variation_values", model: [variationValues: values])
        } else
            render ""
    }

    private def collectVariationValues(BaseProduct baseProduct, VariationGroup variationGroup) {
        def variationValues = []
        def variation = baseProduct.variations.find { it.variationGroup == variationGroup }
        if (variation)
            variationValues.addAll(variation.variationValues)

//        if (baseProduct instanceof Product) {
//            baseProduct.productTypes.each {
//                variationValues.addAll(collectVariationValues(it, variationGroup))
//            }
//        } else if (baseProduct instanceof ProductType) {
//            if (baseProduct.parentProduct)
//                variationValues.addAll(collectVariationValues(baseProduct.parentProduct, variationGroup))
//        }
        return variationValues.unique { it.id }.sort { it.value }
    }

    def list() {
    }

    def save() {
        def addedValueInstance
        if (params.id) {
            addedValueInstance = AddedValue.get(params.id)
            addedValueInstance.properties = params
        } else
            addedValueInstance = new AddedValue(params)
        if (addedValueInstance.validate() && addedValueInstance.save()) {
            render addedValueInstance as JSON
        } else
            render(template: "form", model: [addedValueInstance: addedValueInstance])
    }


    def delete() {
        def addedValueInstance = AddedValue.get(params.id)

        //required for object being deleted
//        addedValueInstance.properties.each {
//            it
//        }

//        addedValueInstance.delete(flush: true)
        addedValueInstance.deleted = true
        addedValueInstance.save(flush: true)
        render 0
    }

    def addedValueImages() {
        render(template: 'addedValueImages', model: [addedValue: AddedValue.get(params.id)])
    }

    def addedValueImagesSave() {
        if (params['image_' + params.id]) {
            def addedValue = AddedValue.get(params.id)
            def img = params['image_' + addedValue.id]
            if (!addedValue.image)
                addedValue.image = new Content(name: addedValue.value, contentType: 'image')
            addedValue.image.fileContent = img.bytes

            addedValue.image.save()
            addedValue.save()
        }

        render 0
    }
}
