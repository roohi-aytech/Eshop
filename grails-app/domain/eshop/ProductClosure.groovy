package eshop

class ProductClosure {
    Product product
    Brand brand
    ProductType productType
    Long distance

    transient String getName() {
        product.name
    }

    transient def getDescription() {
        product.description
    }

    transient def getBrand() {
        product.brand
    }

    transient def getManufactureCountry() {
        product.manufactureCountry
    }

    transient def getManufactureDate() {
        product.manufactureDate
    }
    transient def getProductTypes(){
        product.productTypes
    }
    transient def productId(){
        product.id
    }

    static constraints = {
        name()
        brand()
        productTypes()
        manufactureCountry()
        manufactureDate()
        description()
    }
}
