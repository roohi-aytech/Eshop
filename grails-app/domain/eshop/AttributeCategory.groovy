package eshop

class AttributeCategory {
    static final def showPositionValues = ["filter","compare"]

    String name
    AttributeCategory parentCategory
    ProductType productType

    static hasMany = [showPositions: String]
    static mapping = {
        sort 'name'
    }
    static constraints = {
    }

    String toString() {
        def parent = parentCategory ? parentCategory.toString() + " > " : ""
        parent + name
    }
}
