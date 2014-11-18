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
    String deliveryTime

    DeliverySourceStation deliverySourceStation
    Double deliveryPrice = 0D
    int totalPrice = 0
    int usedAccountValue = 0
    int totalPayablePrice = 0
    Boolean optionalInsurance = false
    Boolean sendFactorWith = false
    Boolean callBeforeSend = false
    Boolean paymentDone = false

    String status
    String trackingCode
    Integer serialNumber
    Date paymentTimeout
    String invoiceType

    String paymentType
    String deliveryTrackingCode

    String buyerName
    String buyerAmount


    transient Date getLastActionDate() {
        if (this.id)
            return OrderTrackingLog.findAllByOrder(this)?.sort { -it.id }?.find()?.date
        return null
    }

    transient String getDeliveryMethodName() {
        deliverySourceStation?.method?.name
    }

    transient String getDeliveryCityName() {
        (sendingAddress?.city?.title) ? "${sendingAddress?.city?.province?.title} - ${sendingAddress?.city?.title}" : sendingAddress.toString()
    }

    transient String getProductsName() {
        items?.collect { it?.productModel?.toString() }?.join(' - ')
    }

    static hasMany = [items: OrderItem, trackingLogs: OrderTrackingLog]

    static constraints = {
        trackingCode nullable: true
        status(nullable: false, inList: OrderHelper.STATUS_LIST)
        ownerName()
        ownerEmail()
        ownerMobile(nullable: true)
        ownerTelephone(nullable: true)
        ownerCode(nullable: true)
        paymentTimeout nullable: true
        lastActionDate()

        ownerSex(nullable: true, inList: ['male', 'female'])
        useAlternateInformation(nullable: true)
        alternateOwnerName(nullable: true)
        alternateOwnerCode(nullable: true)
        alternateOwnerMobile(nullable: true)
        sendFactorWith(nullable: true)
        callBeforeSend(nullable: true)
        items()
        billingAddress(nullable: false)
        sendingAddress(nullable: false)

        deliverySourceStation(nullable: true)
        deliveryPrice(nullable: true)

        invoiceType nullable: true, inList: ['with_added_value', 'without_added_value']
        customer(nullable: true)

        paymentType nullable: true, inList: ['online', 'bank-receipt', 'account-value', 'in-place']
        deliveryTrackingCode nullable: true

        totalPrice nullable: true
        usedAccountValue nullable: true
        totalPayablePrice nullable: true

        serialNumber nullable: true
        deliveryTime(nullable: true)
        buyerName(nullable: true)
        buyerAmount(nullable: true)
        paymentDone(nullable: true)
    }

    static mapping = {
        table(name: 'orders')
    }
}
