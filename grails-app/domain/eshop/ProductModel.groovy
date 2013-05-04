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
        name(nullable: true)
        guarantee()
        variationValues()
        status(inList: ['exists', 'not-exists', 'coming-soon'])
        isDefaultModel()
    }
}
