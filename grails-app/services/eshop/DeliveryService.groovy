package eshop

import eshop.delivery.*

class DeliveryService {

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

    def calculateDeliveryMethodPrice(Order order, DeliveryMethod deliveryMethod) {

        def result = [deliveryMethod: deliveryMethod, sourceStation: null, price: 999999999, priceWithInsurance: 0]

        def targetCity = order?.sendingAddress?.city
        if (targetCity) {

            def totalWeight = order.items.sum(0, { it?.productModel?.product?.weight ?: 0 })
            def totalVolume = order.items.sum(0, { (it?.productModel?.product?.width ?: 0) * (it?.productModel?.product?.height ?: 0) * (it?.productModel?.product?.length ?: 0) })
            def totalPrice = order.items.sum(0, { it?.orderCount * it?.unitPrice ?: 0 })

            deliveryMethod.sourceStations.each { sourceStation ->
                def pricingRule = sourceStation.targetZones?.find { it.cities?.collect { it.id }.contains(targetCity.id) }?.pricingRules?.find { pricingRule ->
                    (!pricingRule.weightMin || pricingRule.weightMin < totalWeight) &&
                            (!pricingRule.weightMax || pricingRule.weightMax >= totalWeight) &&
                            (!pricingRule.volumeMin || pricingRule.volumeMin < totalVolume) &&
                            (!pricingRule.volumeMax || pricingRule.volumeMax >= totalVolume)
                }

                if (pricingRule) {
                    def price = pricingRule.netFactor
                    if (pricingRule.factorCalculationType == 'weight')
                        price = pricingRule.weightFactor * totalWeight
                    else if (pricingRule.factorCalculationType == 'volume')
                        price = pricingRule.volumeFactor * totalWeight
                    else if (pricingRule.factorCalculationType == 'max')
                        price = [pricingRule.weightFactor * totalWeight, pricingRule.volumeFactor * totalWeight, pricingRule.netFactor].max()
                    else if (pricingRule.factorCalculationType == 'min')
                        price *= [pricingRule.weightFactor * totalWeight, pricingRule.volumeFactor * totalWeight, pricingRule.netFactor].min()

                    if (deliveryMethod.insuranceIsRequired || order.optionalInsurance)
                        price = price + ((totalPrice * deliveryMethod.insurancePercent) / 100)

                    if (deliveryMethod.addedValuePercent)
                        price = (price * deliveryMethod.addedValuePercent) / 100

                    if (price <= result.price) {
                        result.sourceStation = sourceStation
                        result.price = price

                        if (deliveryMethod.insurancePercent)
                            result.priceWithInsurance = price + ((totalPrice * deliveryMethod.insurancePercent) / 100)
                        if (deliveryMethod.addedValuePercent)
                            result.priceWithInsurance = (result.priceWithInsurance * deliveryMethod.addedValuePercent) / 100
                    }
                }
            }
        }

        result
    }
}
