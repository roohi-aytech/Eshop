package eshop

class Attribute {
    AttributeValue value
    String attributeValue
    Product product
    AttributeType attributeType

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
