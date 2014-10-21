package eshop.delivery

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class DeliveryPricingRuleController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def deliveryPricingRuleInstance
        if (params.id)
            deliveryPricingRuleInstance = DeliveryPricingRule.get(params.id)
        else
            deliveryPricingRuleInstance = new DeliveryPricingRule()
        render(template: "form", model: [deliveryPricingRuleInstance: deliveryPricingRuleInstance])
    }

    def list() {
    }

    def save() {
        def deliveryPricingRuleInstance
        if (params.id) {
            deliveryPricingRuleInstance = DeliveryPricingRule.get(params.id)
            deliveryPricingRuleInstance.properties = params
        } else
            deliveryPricingRuleInstance = new DeliveryPricingRule(params)
        if (deliveryPricingRuleInstance.validate() && deliveryPricingRuleInstance.save()) {
            render deliveryPricingRuleInstance as JSON
        } else
            render(template: "form", model: [deliveryPricingRuleInstance: deliveryPricingRuleInstance])
    }


    def delete() {
        def deliveryPricingRuleInstance = DeliveryPricingRule.get(params.id)
        deliveryPricingRuleInstance.deleted = true
        deliveryPricingRuleInstance.save()
        render 0
    }
}
