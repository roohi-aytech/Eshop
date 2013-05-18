package eshop

class Accessory {
    static auditable = true

    BaseProduct baseProduct
    ProductType productType
    static hasMany = [attributeMappings: AttributeMapping]
    static composites = ["attributeMappings"]


    static constraints = {
    }
}
