package eshop

class Brand {
    String name
    String description
    String keywords
    String pageTitle

    byte[] logo

    static searchable = true

    static mapping = {
        sort 'name'
    }
    static constraints = {

        name(unique: true)
        description(nullable: true)
        pageTitle(nullable: true)
        keywords(nullable: true)
        logo(nullable: true,maxSize: 1000000000)
    }
    String toString(){
        name
    }
}
