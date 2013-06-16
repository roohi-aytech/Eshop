package eshop

class AttributeValueGroup {
    static auditable = true
    String value
    Boolean deleted=false

    static hasMany = [values: AttributeValue]

    static constraints = {
        value(maxSize: 4000)
        deleted(nullable: true)
    }
}
