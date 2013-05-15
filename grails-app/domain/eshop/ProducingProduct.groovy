package eshop

class ProducingProduct {
    static auditable = true
    Brand brand
    double discount
    Guarantee guarantee
    String refundable
    String refundableDescription
    String discountType

    boolean volume
    String volumeDescription
    boolean retail
    String retailDescription

    String priceType
    String priceDescription

    double cooperationPrice

    Settlement settlement
    String settlementDescription

    int testPeriod

    String deliveryPlace
    double transportationCost
    double addedValue

    static belongsTo = [Producer]

    static hasMany = [productTypes: ProductType]

    Producer producer

    static constraints = {
        productTypes(nullable: true)
        brand(nullable: true)
        guarantee(nullable: true)

        volume()
        volumeDescription(nullable: true)

        retail()
        retailDescription(nullable: true)

        priceType(inList: ["determined", "free"], nullable: true)
        priceDescription(nullable: true)

        discountType(inList: ["percent", "fixed"], nullable: true)
        discount(nullable: true)

        cooperationPrice()

        settlement(nullable: true)
        settlementDescription(nullable: true)

        refundable(inList: ["Yes", "No"], nullable: true)
        refundableDescription(nullable: true)

        testPeriod()

        deliveryPlace(nullable: true)
        transportationCost()
        addedValue(nullable: true)
    }


    static mapping = {
       // sort 'name'
    }
    String toString(){
        (brand == null ? "" : brand.toString() )
    }
}
