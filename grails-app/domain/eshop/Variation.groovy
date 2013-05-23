package eshop

class Variation {
    static auditable = true
    String name
    VariationGroup variationGroup
    BaseProduct baseProduct
    static hasMany = [variationValues : VariationValue]

    static belongsTo = [VariationGroup]

    static searchable = {
//        root false
        only = ['name', 'variationValues', 'variationGroup']
//        name boost:1.0
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
