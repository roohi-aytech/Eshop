package eshop

class Slide {
    static auditable = true

    String name
    String description
    byte[] image
    String url
    Boolean visibleOnFirstPage = false
    Boolean showAsBackground = false
    Boolean deleted = false

    static hasMany = [productTypes: ProductType]

    static constraints = {
        name(nullable: false)
        description(nullable: true)
        url(nullable: false)
        visibleOnFirstPage(nullable: true)
        showAsBackground(nullable: true)
        image(nullable: true, maxSize: 20000000)
    }
}
