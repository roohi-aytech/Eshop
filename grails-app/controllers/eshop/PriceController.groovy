package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON
import grails.plugins.springsecurity.Secured

@Secured(RoleHelper.ROLE_PRICE_ADMIN)
class PriceController {

    def mongoService

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def priceInstance
        def productModel

        if (params.id)
            priceInstance = Price.get(params.id)
        else
            priceInstance = new Price(params)

        if (params.productModel.id)
            productModel = ProductModel.get(params.productModel.id)

        render(template: "form", model: [priceInstance: priceInstance, productModel: productModel])
    }

    def list() {
    }

    def save() {
        def priceInstance
        params.price = params.price.toString().replace(',', '').toDouble()
        if (params.id) {
            priceInstance = Price.get(params.id)
//            priceInstance.properties = params
            priceInstance.productModel = ProductModel.get(params.productModel.id)
            priceInstance.price = params.price?.toDouble()
            if(params.currency)
                priceInstance.currency = Currency.get(params.currency)
        }
        else {
            priceInstance = new Price()
            priceInstance.productModel = ProductModel.get(params.productModel.id)
            priceInstance.price = params.price?.toDouble()
            if(params.currency)
                priceInstance.currency = Currency.get(params.currency)
            priceInstance.startDate = new Date()
            
            def lastPrice = Price.findByProductModelAndEndDateIsNull(priceInstance.productModel)

            if (lastPrice) {
                lastPrice.endDate = new Date()
                lastPrice.save()
            }
        }
        priceInstance.rialPrice = priceInstance.currency ? priceInstance.price * priceInstance.currency.exchangeRate : priceInstance.price

        if (priceInstance.validate() && priceInstance.save()) {
            priceInstance.productModel.product.isSynchronized = false
            priceInstance.productModel.product.save()
            render priceInstance as JSON
        } else
            render(template: "form", model: [priceInstance: priceInstance])
    }

    def delete() {
        def priceInstance = Price.get(params.id)

        priceInstance.delete(flush: true)
        render 0
    }
}
