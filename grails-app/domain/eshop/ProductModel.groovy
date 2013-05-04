package eshop

class ProductModel {
    String name
    Product product
    Guarantee guarantee
    Boolean isDefaultModel

    static hasMany = [variationValues: VariationValue, prices: Price]

    static mapping = {
        sort 'id'
    }

    static constraints = {
    }
}
