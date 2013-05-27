package eshop

class Price {
    static auditable = true
    Double price
    Double rialPrice = 0D
    Currency currency
    Date startDate
    Date endDate
    ProductModel productModel

    static mapping = {
        sort 'startDate'
    }

    static constraints = {
        price(min: 0D)
        rialPrice()
        currency(nullable: true)
        startDate(nullable: false)
        endDate(nullable: true)
        productModel(nullable:true)
    }

    String toString(){
        rialPrice
    }
}
