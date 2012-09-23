package eshop

class ProductInstance {
    Product product
    static hasMany = [variatioValues:VariationValue]

    static constraints = {
    }
}
