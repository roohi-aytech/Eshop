package eshop.delivery

import eshop.City

class DeliveryTargetZone {

    static auditable = true

    DeliverySourceStation sourceStation
    String name

    Boolean deleted = false

    static belongsTo = [DeliverySourceStation]

    static hasMany = [cities: City, pricingRules: DeliveryPricingRule]

    static constraints = {
        name()
        cities()
    }

    @Override
    String toString(){
        name
    }
}
