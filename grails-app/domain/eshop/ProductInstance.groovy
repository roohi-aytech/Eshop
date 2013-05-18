package eshop

class ProductInstance {
    static auditable = true
    Product product
    static hasMany = [variatioValues:VariationValue]

    static constraints = {
    }
}
