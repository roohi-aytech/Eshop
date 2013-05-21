package eshop

class AttributeValue {
    static auditable = true
    String value

    static searchable = {
        root false
    }

    static constraints = {
        value(maxSize: 4000)
    }
    String toString(){
        value
    }
}
