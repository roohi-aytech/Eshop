package eshop.mongo

import eshop.Product


class MongoProduct {
    Long baseProductId

    static mapWith = "mongo"

    transient def getBrandName() {
        this['brand']['name']
    }

    transient def getIsVisible() {
        Product.get(baseProductId)?.isVisible
    }
    void setIsVisible(visible) {
        
    }

    transient def getGuaranteeList() {
        Product.get(baseProductId)?.models?.collect { it?.guarantee }?.unique { it?.id }
    }

    transient def getProductTypesName() {
        this['productTypes']?.collect { it?.name }
    }

    static constraints = {
        baseProductId(unique: true)
    }
}
