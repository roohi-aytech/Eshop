package eshop

import eshop.delivery.*

class DeliveryService {

    def priceService

    def findAllDeliveryMethods(Order order) {

        def deliveryMethods = []

        def targetCity = order?.sendingAddress?.city
        if (targetCity) {

            def methods = DeliveryMethod.createCriteria().list {
                eq('deleted', false)
                sourceStations {
                    targetZones {
                        cities {
                            eq('id', targetCity.id)
                        }
                    }
                }
            }

            methods.each { deliveryMethod ->
                def result = calculateDeliveryMethodPrice(order, deliveryMethod)
                if (result.sourceStation)
                    deliveryMethods << result
            }
        }

        deliveryMethods
    }

    def findAllDeliveryMethodsWithBasket(items) {

        def deliveryMethods = []

        def methods = DeliveryMethod.createCriteria().list {
            eq('deleted', false)
        }

        methods.each { deliveryMethod ->
            def result = calculateDeliveryMethodPriceWithBasket(items, deliveryMethod)
            if (result.sourceStation)
                deliveryMethods << result
        }

        deliveryMethods
    }

    def calculateDeliveryMethodPrice(Order order, DeliveryMethod deliveryMethod) {

        def result = [deliveryMethod: deliveryMethod, sourceStation: null, price: 999999999, priceWithInsurance: 0, hidePrice: false]

        def targetCity = order?.sendingAddress?.city
        if (targetCity) {

            def totalWeight = order.items.findAll { !it.deleted }.sum(0, {
                it?.orderCount * it?.productModel?.product?.weight ?: 0
            })
            def totalVolume = order.items.findAll { !it.deleted }.sum(0, {
                it?.orderCount * (it?.productModel?.product?.width ?: 0) * (it?.productModel?.product?.height ?: 0) * (it?.productModel?.product?.length ?: 0)
            })
            def totalPrice = order.items.findAll { !it.deleted }.sum(0, { it?.orderCount * it?.unitPrice ?: 0 })

            deliveryMethod.sourceStations.each { sourceStation ->
                def pricingRule = sourceStation.targetZones?.find {
                    it.cities?.collect { it.id }.contains(targetCity.id)
                }?.pricingRules?.find { pricingRule ->
                    !pricingRule.deleted &&
                            (!pricingRule.weightMin || pricingRule.weightMin < totalWeight) &&
                            (!pricingRule.weightMax || pricingRule.weightMax >= totalWeight) &&
                            (!pricingRule.volumeMin || pricingRule.volumeMin < totalVolume) &&
                            (!pricingRule.volumeMax || pricingRule.volumeMax >= totalVolume)
                }

                if (pricingRule) {
                    Double price = pricingRule.netFactor
                    if (pricingRule.factorCalculationType == 'weight')
                        price = pricingRule.weightFactor * totalWeight
                    else if (pricingRule.factorCalculationType == 'volume')
                        price = pricingRule.volumeFactor * totalWeight
                    else if (pricingRule.factorCalculationType == 'max')
                        price = [pricingRule.weightFactor * totalWeight, pricingRule.volumeFactor * totalWeight, pricingRule.netFactor].max()
                    else if (pricingRule.factorCalculationType == 'min')
                        price *= [pricingRule.weightFactor * totalWeight, pricingRule.volumeFactor * totalWeight, pricingRule.netFactor].min()

                    if (deliveryMethod.insuranceIsRequired || order.optionalInsurance)
                        price += (totalPrice * deliveryMethod.insurancePercent) / 100

                    if (deliveryMethod.addedValuePercent)
                        price += (price * deliveryMethod.addedValuePercent) / 100

                    if (price <= result.price) {
                        result.sourceStation = sourceStation
                        result.price = price
                        result.hidePrice = deliveryMethod.hidePrice ?: false

                        if (deliveryMethod.insurancePercent)
                            result.priceWithInsurance = price + ((totalPrice * deliveryMethod.insurancePercent) / 100)

                        if (deliveryMethod.addedValuePercent)
                            result.priceWithInsurance = (result.priceWithInsurance * deliveryMethod.addedValuePercent) / 100
                    }
                }
            }
        }

        //round price
        result.price = Math.floor(result.price / (1000 * priceService.getDisplayCurrencyExchangeRate())) * 1000
        result.priceWithInsurance = Math.floor(result.priceWithInsurance / (1000 * priceService.getDisplayCurrencyExchangeRate())) * 1000

        result
    }

    def calculateDeliveryMethodPriceWithBasket(items, DeliveryMethod deliveryMethod) {

        def result = [deliveryMethod: deliveryMethod, sourceStation: null, price: 999999999, priceWithInsurance: 0, hidePrice: false]



        def totalWeight = items?.sum(0, {
            it?.count * it?.weight ?: 0
        })
        def totalVolume = items?.sum(0, {
            it?.count * (it?.width ?: 0) * (it?.height ?: 0) * (it?.length ?: 0)
        })
        def totalPrice = items?.sum(0, { it?.count * it?.price ?: 0 })

        deliveryMethod.sourceStations.each { sourceStation ->
            def pricingRule = sourceStation.targetZones?.find()?.pricingRules?.find { pricingRule ->
                !pricingRule.deleted &&
                        (!pricingRule.weightMin || pricingRule.weightMin < totalWeight) &&
                        (!pricingRule.weightMax || pricingRule.weightMax >= totalWeight) &&
                        (!pricingRule.volumeMin || pricingRule.volumeMin < totalVolume) &&
                        (!pricingRule.volumeMax || pricingRule.volumeMax >= totalVolume)
            }

            if (pricingRule) {
                Double price = pricingRule.netFactor
                if (pricingRule.factorCalculationType == 'weight')
                    price = pricingRule.weightFactor * totalWeight
                else if (pricingRule.factorCalculationType == 'volume')
                    price = pricingRule.volumeFactor * totalWeight
                else if (pricingRule.factorCalculationType == 'max')
                    price = [pricingRule.weightFactor * totalWeight, pricingRule.volumeFactor * totalWeight, pricingRule.netFactor].max()
                else if (pricingRule.factorCalculationType == 'min')
                    price *= [pricingRule.weightFactor * totalWeight, pricingRule.volumeFactor * totalWeight, pricingRule.netFactor].min()

                if (deliveryMethod.addedValuePercent)
                    price += (price * deliveryMethod.addedValuePercent) / 100

                if (price <= result.price) {
                    result.sourceStation = sourceStation
                    result.price = price
                    result.hidePrice = deliveryMethod.hidePrice ?: false
                    result.name=deliveryMethod.name
                    result.description=deliveryMethod.description
                    result.id=deliveryMethod.id
                    if (deliveryMethod.insurancePercent)
                        result.priceWithInsurance = price + ((totalPrice * deliveryMethod.insurancePercent) / 100)

                    if (deliveryMethod.addedValuePercent)
                        result.priceWithInsurance = (result.priceWithInsurance * deliveryMethod.addedValuePercent) / 100
                }
            }
        }

        //round price
        result.price = Math.floor(result.price / (1000 * priceService.getDisplayCurrencyExchangeRate())) * 1000
        result.priceWithInsurance = Math.floor(result.priceWithInsurance / (1000 * priceService.getDisplayCurrencyExchangeRate())) * 1000

        result
    }
}
