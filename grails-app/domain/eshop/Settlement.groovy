package eshop

class Settlement {
    static auditable = true

    String name

//    static searchable = true

    static mapping = {
        sort 'name'
    }
    static constraints = {
        name()
    }

    String toString(){
        name
    }
}
