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
        } else {
            priceInstance = new Price(params)
            priceInstance.variationValues = []
            def variations = Variation.findAllByBaseProduct(Product.get(params.product.id))

            variations.each {
                priceInstance.variationValues.add(VariationValue.get(params."variation_${it.id}"))
            }
        }


                // or just eq('product', someProduct)

        def lastPrice = Price.createCriteria().list {
                isNull('endDate')
                eq('product', priceInstance.product)
                variationValues {
                      'in'('id', priceInstance.variationValues.collect{it.id})
//                    priceInstance.variationValues.each(){
//                        and{
//                        eq("variationGroup",it?.variationGroup)
//                        eq("id", it?.id)
//                        }
//                    }
                }
            }

        if ((params.browsingBrandId as Long) > 0)
//                eq("brand", Brand.get(params.browsingBrandId))
        //    def lastPrice = Price.findAllByProductAndVariationValuesAndEndDateIsNull(priceInstance.product, priceInstance.variationValues)

            if (lastPrice) {
                lastPrice[0].endDate = new Date()
                lastPrice[0].save()
            }


        priceInstance.startDate = new Date()
        priceInstance.rialPrice = priceInstance.currency ? priceInstance.price * priceInstance.currency.exchangeRate : priceInstance.price

        def defaultPrice = Price.createCriteria().list {
            eq('product', priceInstance.product)
            eq('defaultPrice', true)
            variationValues {
                'in'('id', priceInstance.variationValues.collect{it.id})
            }
        }

        if (priceInstance.getDefaultPrice() == true) {
            if (defaultPrice.size() > 0) {
                defaultPrice[0].defaultPrice = false
                defaultPrice[0].save()
            }
        }

        if(defaultPrice.size() == 0)
            priceInstance.defaultPrice = true

        if (priceInstance.validate() && priceInstance.save()) {
            render priceInstance as JSON
        } else
            render(template: "form", model: [priceInstance: priceInstance])
    }


    def delete() {
        def priceInstance = Price.get(params.id)
        if (priceInstance.defaultPrice == true) {
            def prices = Price.createCriteria().list {
                eq('product', priceInstance.product)
                variationValues {
                    'in'('id', priceInstance.variationValues.collect{it.id})
                }
            }
            if (prices) {
                prices[0].defaultPrice = true
                prices[0].save()
            }
        }

        priceInstance.delete(flush: true)
        render 0
    }
}
