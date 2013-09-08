package eshop

class Variation {
    static auditable = true
    String name
    VariationGroup variationGroup
    BaseProduct baseProduct
    static hasMany = [variationValues : VariationValue]

    static belongsTo = [VariationGroup]

    static searchable = {
        only = ['name', 'variationValues', 'variationGroup']
        variationGroup component:true
        variationValues component:true

    }

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
