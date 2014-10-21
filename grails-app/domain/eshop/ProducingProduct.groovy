package eshop

class ProducingProduct {
    static auditable = true
    Brand brand
    String discount
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

    String cooperationPrice

    Settlement settlement
    String settlementDescription

    String testPeriod
    String testPeriodDescription

    String deliveryPlace
    String transportationCost

    String addedValue
    Double addedValueDescription

    static belongsTo = [Producer]

    static hasMany = [productTypes: ProductType]

    Producer producer

    static constraints = {
        productTypes(nullable: true)
        brand(nullable: true)

        volume()

        retail()

        priceType(inList: ["determined", "free"], nullable: true)
        priceDescription(nullable: true)

        discountType(inList: ["percent", "fixed"], nullable: true)
        discount(nullable: true)

        cooperationPrice(nullable: true)

        settlement(nullable: true)

        refundable(inList: ["Yes", "No"], nullable: true)
        refundableDescription(nullable: true)

        testPeriod(inList: ["Yes", "No"], nullable: true)
        testPeriodDescription(nullable: true)

        guarantee(nullable: true)
        deliveryPlace(nullable: true)
        transportationCost(nullable: true)
        addedValue(inList: ["Yes", "No", "Conditionally"], nullable: true)

        retailDescription(nullable: true)
        volumeDescription(nullable: true)
        settlementDescription(nullable: true)
        addedValueDescription(nullable: true)
    }

    static searchable = true

    static mapping = {
       // sort 'name'
    }
    String toString(){
        def res = ""
        productTypes.each {res = res + ", " + it}
        res
    }
}
