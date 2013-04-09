package eshop

class ProducerType {

    String title
    static searchable = true

    static constraints = {
        title()
    }
    String toString(){
        title
    }
}
