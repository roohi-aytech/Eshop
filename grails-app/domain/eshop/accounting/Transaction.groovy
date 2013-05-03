package eshop.accounting

import eshop.AccountingHelper
import eshop.Order
import eshop.User

class Transaction {

    Account account
    Integer value
    String type
    Date date

    User creator
    Order order

    static constraints = {
        account (nullable: true)
        value min: 0
        type inList: AccountingHelper.TRANSACTION_TYPE_LIST
        order nullable: true
    }

    static mapping = {
        value column: 'transaction_value'
        date column: 'transaction_date'
    }
}
