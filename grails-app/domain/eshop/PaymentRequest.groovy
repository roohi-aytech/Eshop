package eshop

import eshop.accounting.Account

class PaymentRequest {

    Account account
    Integer value
    String trackingCode
    Customer owner
    Date creationDate

    static hasMany = [responses: PaymentResponse]

    static constraints = {

    }
}
