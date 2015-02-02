package eshop.discout

import eshop.User

class ExternalDiscount {
    ExternalDiscountDifinition externalDiscountDifinition
    String serial
    String code
    User user
    Date purchaseDate
    Date createDate
    static constraints = {
        code(nullable:true)
        user(nullable:true)
        purchaseDate(nullable:true)
        createDate(nullable:true)
    }
}
