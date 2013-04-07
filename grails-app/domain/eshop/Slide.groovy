package eshop

class Slide {

    String name
    String description
    byte[] image
    String url

    static constraints = {
        name(nullable: false)
        description(nullable: true)
        url(nullable: false)
        image(nullable: false)
    }
}
