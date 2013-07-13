package eshop.delivery

import eshop.City

class DeliverySourceStation {

    static auditable = true

    DeliveryMethod method
    City city
    String phoneNumber
    String address
    String contactPersons

    Boolean deleted = false

    static belongsTo = [DeliveryMethod]

    static hasMany = [targetZones: DeliveryTargetZone]

    static mapping = {
        contactPersons type: "text"
    }

    static constraints = {
        city()
        phoneNumber(nullable: true)
        address(nullable: true)
        contactPersons(nullable: true, maxSize: 20000)
    }

    @Override
    String toString(){
        city.title
    }
}
