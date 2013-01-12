package eshop

class AttributeValue {
    String value
    static constraints = {
        value(maxSize: 4000)
    }
    String toString(){
        value
    }
}
