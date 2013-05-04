package eshop

class VariationValue {
    String value
    VariationGroup variationGroup

    //static hasMany = [variations: Variation, productInstances: ProductInstance]

    static belongsTo = [VariationGroup, Variation, ProductInstance]
    Boolean deleted
    Integer indx

    static transients = ['deleted']

    static mapping = {
        sort 'value'
    }

    static constraints = {
        value(unique: 'variationGroup')
    }

    String toString() {
        value
    }
}
