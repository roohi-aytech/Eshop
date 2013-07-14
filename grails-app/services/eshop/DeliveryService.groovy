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
                deliveryMethods << calculateDeliveryMethodPrice(order, deliveryMethod)
            }
        }

        deliveryMethods
    }

    def calculateDeliveryMethodPrice(Order order, DeliveryMethod deliveryMethod) {

        def result = [deliveryMethod: deliveryMethod, sourceStation: null, price: 0]

        def targetCity = order?.sendingAddress?.city
        if (targetCity) {

            def totalWeight = order.items.sum(0, { it?.productModel?.product?.weight ?: 0 })
            def totalVolume = order.items.sum(0, { (it?.productModel?.product?.width ?: 0) * (it?.productModel?.product?.height ?: 0) * (it?.productModel?.product?.length ?: 0) })

            deliveryMethod.sourceStations.each { sourceStation ->
                def pricingRule = sourceStation.targetZones.find { it.cities.collect { it.id }.contains(targetCity.id) }.pricingRules.find { pricingRule ->
                    (!pricingRule.weightMin || pricingRule.weightMin <= totalWeight) &&
                            (!pricingRule.weightMax || pricingRule.weightMax >= totalWeight) &&
                            (!pricingRule.volumeMin || pricingRule.volumeMin <= totalVolume) &&
                            (!pricingRule.volumeMax || pricingRule.volumeMax >= totalVolume)
                }

                if (pricingRule) {
                    def price = pricingRule.factor
                    if (pricingRule.type == 'weight')
                        price *= totalWeight
                    else if (pricingRule.type == 'volume')
                        price *= totalWeight

                    if (price <= result.price) {
                        result.sourceStation = sourceStation
                        result.price = price
                    }
                }
            }
        }

        result
    }
}
