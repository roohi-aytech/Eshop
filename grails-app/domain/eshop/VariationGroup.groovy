package eshop

class VariationGroup {
    String name
    String representationType
    static hasMany = [variationValues: VariationValue, variations: Variation]
    static searchable=true
    static constraints = {
        name()
        representationType(inList: ["String", "Color"])
        variationValues()
    }

    String toString() {
        name
    }
}
