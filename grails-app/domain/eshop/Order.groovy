package eshop

class Order {
    static auditable = true

    Customer customer

    String ownerName
    String ownerEmail
    String ownerMobile
    String ownerTelephone

    Address billingAddress
    Address sendingAddress

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
    }

    static mapping = {
        table(name: 'orders')
    }
}
