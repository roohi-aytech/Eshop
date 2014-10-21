package eshop

class Attribute {
    static auditable = true
    AttributeValue value
    String attributeValue
    Product product
    AttributeType attributeType

    static searchable = {
        only = ['attributeValue', 'attributeType']
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
        attributeType(nullable: true)
    }

    @Override
    String toString() {
        attributeType?.name + ": " + value
    }
}
