package eshop

class RelatedProduct {
    static auditable = true

    ProductType productType
    Product product

    BaseProduct baseProduct

    static transients = ['deleted']

    static constraints = {

        productType(nullable: true)
        product(nullable: true)
    }
}
