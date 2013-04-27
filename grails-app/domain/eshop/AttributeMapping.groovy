package eshop

class AttributeMapping {
    Attribute sourceAttribute
    Attribute destinationAttribute

    static belongsTo = [Accessory]
    static constraints = {
    }
}
