package eshop.accounting

import eshop.Customer
import eshop.Order

class OnlinePayment {

    static auditable = true

    Account account
    Order order
    int amount
    Date date
    Customer customer
    String initialResultCode
    String referenceId
    String resultCode
    String transactionReferenceCode
    Boolean usingCustomerAccountValueAllowed

    static constraints = {
        account()
        customer nullable: true
        order nullable: true
        amount()
        date()
        initialResultCode nullable: true
        referenceId nullable: true
        resultCode nullable: true
        transactionReferenceCode nullable: true
    }
}
