package eshop

class AttributeCategory {
    static auditable = true
    static final def showPositionValues = ["filter","compare"]

    String name
    AttributeCategory parentCategory
    ProductType productType
    int sortIndex
    Boolean deleted=false

    static hasMany = [showPositions: String]
    static mapping = {
        sort 'sortIndex'
    }
    static constraints = {
        sortIndex(nullable:true)
        name(nullable:true)
        deleted(nullable: true)
    }

    String toString() {
        def parent = parentCategory ? parentCategory.toString() + " > " : ""
        parent + name
    }
}
