package eshop

class AddedValue {
    String name
    BaseProduct baseProduct
    Double value = 0D
    String type
    static hasMany = [variationValues: VariationValue]

    static constraints = {
        name()
        type(inList: ["percent", "fixed"])
        value()
    }
}
