package eshop

class AddedValue {
    static auditable = true
    String name
    BaseProduct baseProduct
    Double value = 0D
    String type
    String processTime
    Date startDate
    Date endDate
    int remainCount
    Brand brand
    boolean deleted = false
    static hasMany = [variationValues: VariationValue]

    static mapping = {
        sort 'name'
    }

    static constraints = {
        name()
        type(inList: ["percent", "fixed"])
        processTime(inList: ["mandetory","optional"])
        value()
        processTime()
        variationValues()
        brand(nullable: true)
        startDate(nullable: true)
        endDate(nullable: true)
        remainCount(nullable: true)

    }

    @Override
    String toString(){
        name
    }
}
