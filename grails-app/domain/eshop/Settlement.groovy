package eshop

class Settlement {

    String name

    static searchable = true

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
