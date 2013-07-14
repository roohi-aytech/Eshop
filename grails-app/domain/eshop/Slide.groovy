package eshop

class Slide {
    static auditable = true

    String name
    String description
    byte[] image
    byte[] image1024
    byte[] image1280
    byte[] image1440
    String url
    Boolean visibleOnFirstPage = false
    Boolean deleted = false

    static hasMany = [productTypes: ProductType]

    static constraints = {
        name(nullable: false)
        description(nullable: true)
        url(nullable: false)
        visibleOnFirstPage(nullable: true)
        image(nullable: true, maxSize: 20000000)
        image1024(nullable: false, maxSize: 20000000)
        image1280(nullable: false, maxSize: 20000000)
        image1440(nullable: false, maxSize: 20000000)
    }
}
