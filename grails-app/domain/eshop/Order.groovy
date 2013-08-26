package eshop

import eshop.delivery.DeliveryMethod
import eshop.delivery.DeliverySourceStation

class Order {
    static auditable = true

    Customer customer

    String ownerName
    String ownerEmail
    String ownerMobile
    String ownerTelephone
    String ownerCode
    String ownerSex

    Boolean useAlternateInformation
    String alternateOwnerName
    String alternateOwnerCode
    String alternateOwnerMobile

    Address billingAddress
    Address sendingAddress

    DeliverySourceStation deliverySourceStation
    Double deliveryPrice = 0D
    int totalPrice = 0
    Boolean optionalInsurance = false

    String status

    String trackingCode

    static hasMany = [items: OrderItem, trackingLogs: OrderTrackingLog]

    static constraints = {
        trackingCode nullable: true
        status(nullable: false, inList: OrderHelper.STATUS_LIST)
        customer(nullable: true)
        ownerEmail()
        ownerMobile()
        ownerTelephone()
        ownerCode(nullable: true)
        ownerSex(nullable: true, inList: ['male', 'female'])
        useAlternateInformation(nullable: true)
        alternateOwnerName(nullable: true)
        alternateOwnerCode(nullable: true)
        alternateOwnerMobile(nullable: true)
        items()
        billingAddress(nullable: false)
        sendingAddress(nullable: false)

        deliverySourceStation(nullable: true)
        deliveryPrice(nullable: true)
    }

    static mapping = {
        table(name: 'orders')
    }
}
