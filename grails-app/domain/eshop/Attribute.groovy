package eshop

class Attribute {
    static auditable = true
    AttributeValue value
    String attributeValue
    Product product
    AttributeType attributeType

    static searchable = {
//        root false
        only = ['attributeValue', 'attributeType']
//        only: ['attributeValue']
//        alias: "AttributeClass"
//        value component:true
//        attributeValue boost:1.5
        attributeType component:true
    }

    static belongsTo = [AttributeType]

    static mapping = {
        sort 'attributeValue'
    }

    static constraints = {
        value(nullable: true)
        attributeValue(nullable: true)
        product()
        attributeType()
    }

    @Override
    String toString() {
        attributeType.name + ": " + value
    }
}
