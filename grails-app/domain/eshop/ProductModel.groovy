package eshop

class ProductModel {
    String name
    Product product
    Guarantee guarantee
    String status
    Boolean isDefaultModel

    static hasMany = [variationValues: VariationValue, prices: Price]

    static mapping = {
        sort 'id'
    }

    static constraints = {
        status(inList: ['exists', 'not-exists', 'commin-soon'])
    }
}