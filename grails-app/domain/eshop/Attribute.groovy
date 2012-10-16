package eshop

class Attribute {
    String attributeValue
    Product product
    AttributeType attributeType

    static belongsTo = [AttributeType]

    static mapping = {
        sort 'attributeValue'
    }

    static constraints = {
        attributeValue(nullable: true)
        product()
        attributeType()
    }

    @Override
    String toString() {
        attributeType.name + ": " + attributeValue
    }
}
