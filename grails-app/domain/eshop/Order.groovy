package eshop

class Order {

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
        customer(nullable: false)
        billingAddress(nullable: false)
        sendingAddress(nullable: false)
        status(nullable: false, inList: OrderHelper.STATUS_LIST)
        RoleHelper.ROLE_CUSTOMER
    }

    static mapping = {
        table(name: 'orders')
    }
}
