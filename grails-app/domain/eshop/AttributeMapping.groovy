package eshop

class AttributeMapping {
    static auditable = true
    Attribute sourceAttribute
    Attribute destinationAttribute

    static belongsTo = [Accessory]
    static constraints = {
    }
}
