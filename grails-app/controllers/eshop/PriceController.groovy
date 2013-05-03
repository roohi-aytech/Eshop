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
        def product

        if (params.id)
            priceInstance = Price.get(params.id)
        else
            priceInstance = new Price(params)

        if (params.product.id)
            product = Product.get(params.product.id)

        render(template: "form", model: [priceInstance: priceInstance, product: product])
    }

    def list() {
    }

    def save() {
        def priceInstance
        if (params.id) {
            priceInstance = Price.get(params.id)
            priceInstance.properties = params
            priceInstance.variationValues = []
            def variations = Variation.findAllByBaseProduct(Product.get(params.product.id))

            variations.each {
                priceInstance.variationValues.add(VariationValue.get(params."variation_${it.id}"))
            }
        }
        else {
            priceInstance = new Price(params)
            priceInstance.variationValues = []
            def variations = Variation.findAllByBaseProduct(Product.get(params.product.id))

            variations.each {
                priceInstance.variationValues.add(VariationValue.get(params."variation_${it.id}"))
            }
            boolean tmp
            def lastPrice
            def allLastPrices = Price.findByProductAndEndDateIsNull(priceInstance.product)
            allLastPrices.each {
                tmp = true
                it.variationValues.each {
                    if(!priceInstance.variationValues.collect{it.id}.contains(it.id)){
                        tmp = false
                    }
                }
                if (tmp == true){
                    lastPrice = it
                }
            }
            if (lastPrice) {
                lastPrice.endDate = new Date()
                lastPrice.save()
            }
        }
        priceInstance.startDate = new Date()
        priceInstance.rialPrice = priceInstance.currency ? priceInstance.price * priceInstance.currency.exchangeRate : priceInstance.price

        def tmp
        def defaultPrice
        def allPrices = Price.findAllByProductAndDefaultPrice(priceInstance.product, true)

        allPrices.each {
            tmp = true
            it.variationValues.each {
                if(!priceInstance.variationValues.collect{it.id}.contains(it.id)){
                    tmp = false
                }
            }
            if (tmp == true){
                defaultPrice = it
            }
        }

        //the previous default price should be set to false, and this is the new default price
        if (priceInstance.getDefaultPrice() == true) {
            if (defaultPrice) {
                defaultPrice.defaultPrice = false
                defaultPrice.save()
            }
        }
        //it is the first record and should be set to default
        if(defaultPrice == null)
            priceInstance.defaultPrice = true

        //if this used to be the default price, and now the first record should be set to true
        if(defaultPrice != null & !priceInstance.getDefaultPrice()){
            def price
            def Prices = Price.findAllByProduct(priceInstance.product)
            for (it in Prices) {
                tmp = true
                it.variationValues.each {
                    if (!priceInstance.variationValues.collect { it.id }.contains(it.id)) {
                        tmp = false
                    }
                }
                if (tmp == true) {
                    it.defaultPrice = true
                    it.save()
                    break
                }
            }
        }

        if (priceInstance.validate() && priceInstance.save()) {
            render priceInstance as JSON
        } else
            render(template: "form", model: [priceInstance: priceInstance])
    }

    def setDefaultValueForTheFirstPrice(){

    }

    def delete() {
        def priceInstance = Price.get(params.id)
        if (priceInstance.defaultPrice == true) {
            def tmp
            def price
            def allPrices = Price.findAllByProductAndDefaultPrice(priceInstance.product, false)
            for (it in allPrices) {
                tmp = true
                it.variationValues.each {
                    if (!priceInstance.variationValues.collect { it.id }.contains(it.id)) {
                        tmp = false
                    }
                }
                if (tmp == true) {
                    it.defaultPrice = true
                    it.save()
                    break
                }
            }
        }

        priceInstance.delete(flush: true)
        render 0
    }
}
