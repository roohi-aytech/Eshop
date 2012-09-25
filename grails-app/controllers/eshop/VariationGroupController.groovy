package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

@Secured(RoleHelper.ROLE_PRODUCT_TYPE_ADMIN)
class VariationGroupController {

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
    }

    def form() {
        def variationGroup
        if (params.id)
            variationGroup = VariationGroup.findById(params.id)
        else
            variationGroup = new VariationGroup()

        render(template: "form", model: [variationGroupInstance: variationGroup])
    }

    def variationForm() {
        def variation
        if (params.id)
            variation = Variation.findById(params.id)
        else
            variation = new Variation()

        render(template: "variation_form", model: [variationInstance: variation, baseProductId: params.baseProductId])
    }

    def variationValueForm() {
        def variationValue
        if (params.id)
            variationValue = VariationValue.findById(params.id)
        else
            variationValue = new VariationValue(params)
        render(template: "variation_value_add", model: [variationValueInstance: variationValue])
    }

    def saveVariationValue() {
        def variationValue
        if (params.id) {
            variationValue = VariationValue.findById(params.id)
            variationValue.properties = params
        }
        else {
            variationValue = new VariationValue(params)
            variationValue.indx=0
        }
        variationValue.save()
        render 0
    }

    def variationValues() {
        def variationGroup
        def variation
        if (params.id)
            variationGroup = VariationGroup.findById(params.id)

        if (params.baseProductId && variationGroup) {
            def baseProduct = BaseProduct.get(params.baseProductId)
            variation = Variation.findByBaseProductAndVariationGroup(baseProduct, variationGroup)
        }
        if (!variationGroup)
            variationGroup = new VariationGroup()
        if (!variation)
            variation = new Variation()

        render(template: "variation_values", model: [variationGroupInstance: variationGroup, variationInstance: variation])
    }

    def save() {
        def variationGroup
        if (params.id) {
            variationGroup = VariationGroup.get(params.id)
            variationGroup.properties = params
        }
        else
            variationGroup = new VariationGroup(params)
        bindComposites(variationGroup, params)
        variationGroup.save()
        render 0
    }

    def delete() {
        def variationGroup = VariationGroup.get(params.id)
        if (variationGroup)
            variationGroup.delete()
        render 0
    }

    def deleteVariation() {
        def variation = Variation.get(params.id)
        if (variation)
            variation.delete()
        render 0
    }

    def saveVariation() {
        def variation
        if (params.id) {
            variation = Variation.get(params.id)
            variation.properties = params
        }
        else
            variation = new Variation(params)

        variation.variationValues = request.getParameterValues('variationValues').collect {VariationValue.findById(it.toLong())}

        variation.save()
        render 0
    }


}
