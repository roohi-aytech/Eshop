package eshop

class Accessory {

    BaseProduct baseProduct
    ProductType productType
    static hasMany = [attributeMappings: AttributeMapping]
    static composites = ["attributeMappings"]


    static constraints = {
    }
}
