package eshop

class Brand {
    static auditable = true
    String name
    String description
    String keywords
    String pageTitle
    String searchKeys

    byte[] logo

    static searchable = true

    static mapping = {
        sort 'name'
        searchKeys type: 'text'
    }
    static constraints = {

        name(unique: true)
        description(nullable: true)
        pageTitle(nullable: true)
        keywords(nullable: true)
        logo(nullable: true,maxSize: 1000000000)
        searchKeys(nullable:true)
    }
    String toString(){
        name
    }
}
