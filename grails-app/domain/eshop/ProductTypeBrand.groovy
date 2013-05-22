package eshop

class ProductTypeBrand {
    static auditable = true
    Guarantee guarantee
    Brand brand
    static hasMany = [productTypes: ProductType]

    static searchable = true

    static mapping = {
    }

    static constraints = {
        productTypes(nullable: true)
        brand(nullable: true)
    }
}
