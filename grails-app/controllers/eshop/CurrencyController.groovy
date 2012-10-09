package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON
import grails.plugins.springsecurity.Secured

@Secured(RoleHelper.ROLE_PRODUCT_ADMIN)
class CurrencyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {

    }

    def form() {
        def currencyInstance;
        if (params.id)
            currencyInstance = Currency.get(params.id)
        else
            currencyInstance = new Currency()
        render(template: "form", model: [currencyInstance: currencyInstance])
    }

    def save() {
        def currencyInstance;
        if (params.id) {
            currencyInstance = Currency.get(params.id)
            currencyInstance.properties = params
        }
        else
            currencyInstance = new Currency(params)
        if (currencyInstance.validate() && currencyInstance.save()) {

            def oldCurrencyLog = CurrencyLog.findByCurrencyAndEndDateIsNull(currencyInstance)
            if (oldCurrencyLog) {
                oldCurrencyLog.endDate = new Date()
                oldCurrencyLog.save()
            }

            def curCurrencyLog = new CurrencyLog(startDate: new Date(), exchangeRate: currencyInstance.exchangeRate, currency: currencyInstance)
            curCurrencyLog.save()

            def prices = Price.findByCurrencyAndEndDateIsNull(currencyInstance)
            prices.each {
                it.endDate = new Date();
                it.save()

                def newPrice = new Price(currency: currencyInstance, price: it.price, product: it.product, startDate: new Date(), rialPrice: (it.price * currencyInstance.exchangeRate))
                newPrice.save()
            }

            render currencyInstance as JSON
        } else {
            render(template: "form", model: [currencyInstance: currencyInstance])
        }
    }


    def delete() {
        try {
            def currencyInstance = Currency.get(params.id)
            currencyInstance.delete(flush: true)
            render 0
        } catch (x) {
            x.printStackTrace()
            render 1
        }
    }
}
