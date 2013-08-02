package eshop.accounting

import eshop.Brand
import eshop.ProductType

class AccountFilter {

    Account account
    ProductType productType

    static hasMany = [brands:Brand]

    static constraints = {
        account()
        brands()
        productType()
    }
}
