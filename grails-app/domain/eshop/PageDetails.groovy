package eshop

class PageDetails {
    static auditable = true
    ProductType productType
    Brand brand
    String title
    String description
    String keywords
    static constraints = {
        productType(nullable: true)
        brand(nullable: true)
        title(nullable: true)
        keywords(nullable: true)
        description(nullable: true)
    }
}
