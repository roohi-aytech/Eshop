package eshop

class VariationValue {
    static auditable = true
    String value
    Content image
    VariationGroup variationGroup

//    static hasMany = [variations: Variation, productInstances: ProductInstance]
    static hasMany = [productImageVariations:Content]
    static belongsTo = [VariationGroup, Variation, ProductInstance,Content,Set]
    Boolean deleted
    Integer indx

    static searchable = true

    static transients = ['deleted']

    static mapping = {
        sort 'value'
    }

    static constraints = {
        value(unique: 'variationGroup')
        image(nullable:true)
    }

    String toString() {
        value
    }
}
