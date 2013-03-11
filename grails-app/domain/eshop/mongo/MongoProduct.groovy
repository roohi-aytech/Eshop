package eshop.mongo

import eshop.Product


class MongoProduct {
    Long baseProductId

    static mapWith = "mongo"

    transient def getBrandName(){
        this['brand']['name']
    }
    transient def getProductTypesName(){
        this['productTypes']?.collect{it?.name}
    }
    static constraints = {
    }
}