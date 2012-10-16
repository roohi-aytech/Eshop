package eshop

class Variation {
    String name
    VariationGroup variationGroup
    BaseProduct baseProduct
    static hasMany = [variationValues:VariationValue]

    static belongsTo = [VariationGroup]


    static mapping = {
        sort 'name'
    }

    static constraints = {
        name()
        variationGroup()
        variationValues()

    }

    @Override
    String toString() {
        name
    }
}
