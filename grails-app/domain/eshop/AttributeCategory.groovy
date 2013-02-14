package eshop

class AttributeCategory {
    static final def showPositionValues = ["filter","compare"]

    String name
    AttributeCategory parentCategory
    ProductType productType
    int sortIndex

    static hasMany = [showPositions: String]
    static mapping = {
        sort 'name'
    }
    static constraints = {
        sortIndex(nullable:true)
        name(nullable:true)
    }

    String toString() {
        def parent = parentCategory ? parentCategory.toString() + " > " : ""
        parent + name
    }
}
