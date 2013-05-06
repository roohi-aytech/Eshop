package eshop

class ProductModel {
    String name
    Product product
    Guarantee guarantee
    String status
    Boolean isDefaultModel


    static hasMany = [variationValues: VariationValue, prices: Price]

    static composites = ["prices"]

    static mapping = {
        sort 'id'
        prices cascade: "all-delete-orphan"
    }

    static constraints = {
        name(nullable: true)
        guarantee()
        variationValues()
        status(inList: ['exists', 'not-exists', 'coming-soon'])
        isDefaultModel()
    }
}
