package eshop

import grails.converters.JSON
import grails.plugins.springsecurity.Secured

@Secured(RoleHelper.ROLE_PRODUCT_TYPE_ADMIN)
class ProducerTypeController {
    def form() {
        def producerType
        if (params.id)
            producerType = ProducerType.findById(params.id)
        else
            producerType = new ProducerType()

        render(template: "/producerType/form", model: [producerTypeInstance: producerType])
    }

    def save() {
        def producerType
        if (params.id) {
            producerType = ProducerType.get(params.id)
            def logo = producerType.logo
            producerType.properties = params
        }
        else
            producerType = new ProducerType(params)
        if (producerType.validate()) {
            producerType.save(flush: true)
            render producerType as JSON
        }
        else {
            render(template: "/producerType/form", model: [producerTypeInstance: producerType])
        }
    }

    def delete() {
        def producerType = ProducerType.get(params.id)
        if (producerType)
            producerType.delete()
        render 0
    }

    def list() {

    }

    def index() {
        redirect(action: "list")
    }
}
