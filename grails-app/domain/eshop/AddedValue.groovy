package eshop

class AddedValue {
    String name
    BaseProduct baseProduct
    Double value = 0D
    String type
    String processTime
    static hasMany = [variationValues: VariationValue]

    static mapping = {
        sort 'name'
    }

    static constraints = {
        name()
        type(inList: ["percent", "fixed"])
        processTime(inList: ["everyWhere","orderTime"])
        value()
        processTime()
        variationValues()
    }
}
