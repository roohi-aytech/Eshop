package eshop.discout

import eshop.Product
import eshop.ProductType
import eshop.Brand
import eshop.VariationValue

/**
 * Created with IntelliJ IDEA.
 * User: roohi
 * Date: 2/16/13
 * Time: 12:31 PM
 * To change this template use File | Settings | File Templates.
 */
class ProductCriteria {
    Product product
    ProductType productType
    Brand brand
    Double fromPrice
    Double toPrice

    Boolean deleted
    Integer indx

    static transients = ['deleted']
    static belongsTo = [Discount]

//    static hasMany = [variationValues: VariationValue]

    static constraints = {
        product(nullable: true)
        productType(nullable: true)
        brand(nullable: true)
        fromPrice(nullable: true)
        toPrice(nullable: true)
    }
}
