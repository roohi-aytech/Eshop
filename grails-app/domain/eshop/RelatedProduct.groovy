package eshop

class RelatedProduct {

    ProductType productType
    Product product

    BaseProduct baseProduct

    static transients = ['deleted']

    static constraints = {

        productType(nullable: true)
        product(nullable: true)
    }
}
