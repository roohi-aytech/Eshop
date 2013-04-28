package eshop

class Guarantee {

    String name
    String description
    int period
    byte[] logo

    static searchable = true

    static mapping = {
        sort 'name'
    }

    static constraints = {
        name(nullable: true)
        period()
        description(nullable: true)
        logo(nullable: true,maxSize: 1000000000)

    }

    String toString(){
        name
    }

}
