package eshop.mongo

import eshop.Product


class MongoProduct {
    Long baseProductId
    Long modelId

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
        modelId(unique: true)
    }
}
