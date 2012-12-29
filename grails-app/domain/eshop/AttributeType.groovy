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

    static final def showPositionValues = ["filter", "productList", "compare", "productDetails", "productFullDetails"]

    static hasMany = [attributes: Attribute, values: String, showPositions: String]
    static belongsTo = [ProductType, AttributeCategory]

    static mapping = {
        sort 'name'
        attributes cascade: 'delete'
    }

    static constraints = {
        name(nullable: false)
        attributeType(inList: ["String", "Text", "Date", "Number"])
        defaultValue(nullable: true)
        category(nullable: true)
        values()
        productType()
    }

    transient def getOptionValues() {
        def vals = values?.sort()?.collect { val ->
            return [
                    key: val?.replace("\n", "\\n")?.replace("\r",""),
                    val: val
            ]
        }
//        vals << [key: 'N/A', val: 'N/A']
        vals
    }

    @Override
    String toString() {
        name
    }
}
