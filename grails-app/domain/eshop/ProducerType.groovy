package eshop

class ProducerType {
    static auditable = true

    String title
//    static searchable = true

    static constraints = {
        title()
    }
    String toString(){
        title
    }
}
