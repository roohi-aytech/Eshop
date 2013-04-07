package eshop

class ProducingProduct {

    Product product
    ProductType productType
    Brand brand
    String discount

   static belongsTo = [Producer]

    static constraints = {
        product(nullable: true)
        productType(nullable: true)
        brand(nullable: true)
        discount(nullable: true)
    }

    Boolean deleted
    Integer indx

    static transients = ['deleted']

    static mapping = {
       // sort 'name'
    }
    String toString(){
      (product == null ? "" : product.toString() + " ") +
               (productType == null ? "" : productType.toString() + " ") +
               (brand == null ? "" : brand.toString() )
    }
}