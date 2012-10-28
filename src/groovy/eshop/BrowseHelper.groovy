package eshop

/**
 * Created with IntelliJ IDEA.
 * User: Farshid
 * Date: 10/28/12
 * Time: 12:08 PM
 * To change this template use File | Settings | File Templates.
 */
class BrowseHelper {
    def static getAllSubProductTypes(ProductType productType) {
        def result = []
        productType.children.each {
            result << it
            result.addAll(getAllSubProductTypes(it))
        }
        return result
    }
}
