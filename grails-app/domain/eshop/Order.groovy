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
    Boolean optionalInsurance = false

    String status

    static hasMany = [items: OrderItem, trackingLogs: OrderTrackingLog]

    static constraints = {
        status(nullable: false, inList: OrderHelper.STATUS_LIST)
        customer(nullable: false)
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
