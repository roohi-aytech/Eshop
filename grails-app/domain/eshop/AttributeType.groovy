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
    AttributeCategory category

    static final def showPositionValues=["filter","productList","compare","productDetails","productFullDetails"]

    static hasMany = [attributes: Attribute, values: String,showPositions:String]
    static belongsTo = [ProductType,AttributeCategory]

    static mapping = {
        attributes cascade: 'delete'
    }

    static constraints = {
        name(nullable: false)
        attributeType(inList: ["String", "Date", "Number"])
        defaultValue(nullable: true)
        category(nullable: true)
        values()
        productType()
    }

    @Override
    String toString() {
        name
    }
}
