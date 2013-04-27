package eshop

class ProducingProduct {
    Brand brand
    double discount
    Guarantee guarantee
    String refundable
    String discountType
    String paidOff
    String delivery

    static belongsTo = [Producer]

    static hasMany = [productTypes: ProductType]

    Producer producer

    static constraints = {
        productTypes(nullable: true)
        brand(nullable: true)
        guarantee(nullable: true)
        discountType(inList: ["percent", "fixed"])
        discount(nullable: true)
        paidOff(nullable: true)
        delivery(nullable: true)
        refundable(inList: ["Yes", "No"])
    }

    Boolean deleted
    Integer indx

    static transients = ['deleted']

    static mapping = {
       // sort 'name'
    }
    String toString(){
        (brand == null ? "" : brand.toString() )
    }
}
