package eshop

class ProducerType {

    String title
    static searchable = true
    Producer producer

    static constraints = {
        title()
    }
    String toString(){
        title
    }
}
