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
        customer(nullable: false)
        ownerEmail()
        ownerMobile()
        ownerTelephone()
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
