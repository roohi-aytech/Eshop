package eshop

class ProductTypeBrand {
    static auditable = true

    Brand brand
    static hasMany = [productTypes: ProductType]

    static belongsTo = [Guarantee]

    Boolean deleted
    Integer indx

    static transients = ['deleted']

    static mapping = {
    }

    static constraints = {
        productTypes(nullable: true)
        brand(nullable: true)
    }
}
