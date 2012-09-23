package eshop

/**
 * Created with IntelliJ IDEA.
 * User: roohi
 * Date: 8/14/12
 * Time: 7:52 PM
 * To change this template use File | Settings | File Templates.
 */

class AttributeType {
    String name
    String attributeType
    String defaultValue
    ProductType productType

    static hasMany = [attributes: Attribute, values: String]
    static belongsTo = [ProductType]

    static mapping = {
        attributes cascade: 'delete'
    }

    static constraints = {
        name(nullable: false)
        attributeType(inList: ["String", "Date", "Number"])
        defaultValue(nullable: true)
        values()
        productType()
    }

    @Override
    String toString() {
        name
    }
}
