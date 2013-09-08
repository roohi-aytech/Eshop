package eshop

class ProducerType {
    static auditable = true

    String title

    static constraints = {
        title()
    }
    String toString(){
        title
    }
}
