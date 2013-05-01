package eshop

import eshop.accounting.CustomerTransaction

class AccountingService {

    def calculateCustomerAccountValue(Customer customer) {

        def value = CustomerTransaction.findAllByCreator(customer).sum {it.type == AccountingHelper.TRANSACTION_TYPE_WITHDRAWAL ? -it.value : it.value}
        if(value) return value

        0
    }
}
