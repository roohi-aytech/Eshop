package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON
import grails.plugins.springsecurity.Secured

@Secured(RoleHelper.ROLE_PRICE_ADMIN)
class PriceController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def priceInstance
        if (params.id)
            priceInstance = Price.get(params.id)
        else
            priceInstance = new Price(params)
        render(template: "form", model: [priceInstance: priceInstance])
    }

    def list() {
    }

    def save() {
        def priceInstance
        if (params.id) {
            priceInstance = Price.get(params.id)
            priceInstance.properties = params
        }
        else {
            priceInstance = new Price(params)

            def lastPrice = Price.findByProductAndEndDateIsNull(priceInstance.product)
            if (lastPrice) {
                lastPrice.endDate = new Date()
                lastPrice.save()
            }
        }

        priceInstance.startDate = new Date()
        priceInstance.rialPrice = priceInstance.currency ? priceInstance.price * priceInstance.currency.exchangeRate : priceInstance.price

        if (priceInstance.validate() && priceInstance.save()) {
            render priceInstance as JSON
        }
        else
            render(template: "form", model: [priceInstance: priceInstance])
    }


    def delete() {
        def priceInstance = Price.get(params.id)
        priceInstance.delete(flush: true)
        render 0
    }
}