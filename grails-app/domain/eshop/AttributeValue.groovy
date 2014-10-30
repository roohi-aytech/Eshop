package eshop

class AttributeValue {
    static auditable = true
    String value
    Boolean deleted=false
    AttributeValueGroup group

    static searchable = {
        root false
    }

    static constraints = {
        value(maxSize: 4000)
        deleted(nullable: true)
        group nullable: true
    }
    String toString(){
        value
    }
}
