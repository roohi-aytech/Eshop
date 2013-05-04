package eshop

import eshop.accounting.Account

class PaymentRequest {

    Account account
    Integer value
    String trackingCode
    Customer owner
    Date creationDate
    Order order
    Boolean usingCustomerAccountValueAllowed

    Boolean getApproved(){
        responses.toArray().sort {it.creationDate}.last().approved
    }

    static hasMany = [responses: PaymentResponse]
    static composites = ["responses"]

    static transients = ['approved']

    static mapping = {
        sort 'creationDate'
        responses cascade: "all-delete-orphan"
    }

    static constraints = {
        owner()
        account()
        value()
        trackingCode()
        creationDate(persian:true)
        order(nullable: true)
    }
}