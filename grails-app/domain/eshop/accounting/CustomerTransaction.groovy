package eshop.accounting

import eshop.Customer

class CustomerTransaction extends Transaction {

    static constraints = {
    }

    static mapping = {
        tablePerHierarchy(false)
    }
}
