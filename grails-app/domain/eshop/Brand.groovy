package eshop

class Brand {
    String name
    String description
    byte[] logo

    static searchable = true

    static mapping = {
        sort 'name'
    }
    static constraints = {

        name(unique: true)
        description(nullable: true)
        logo(nullable: true,maxSize: 1000000000)
    }
    String toString(){
        name
    }
}
