package eshop

class VariationValue {
    String value
    VariationGroup variationGroup

    static belongsTo = [VariationGroup, Variation, ProductInstance]

    static hasMany = [variations: Variation, productInstances: ProductInstance]
    static constraints = {
    }

    String toString() {
        value
    }
}
