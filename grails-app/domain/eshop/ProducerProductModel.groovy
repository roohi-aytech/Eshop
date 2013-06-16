package eshop

class ProducerProductModel {
    static auditable = true

    Producer producer
    ProductModel productModel

    Brand brand
    String discount
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
    double addedValueDescription

    static constraints = {
        producer(nullable: true)
        productModel(nullable: true)

        brand(nullable: true)
        volume()
        volumeDescription(nullable: true)

        retail()
        retailDescription(nullable: true)

        priceType(inList: ["determined", "free"], nullable: true)
        priceDescription(nullable: true)

        discountType(inList: ["percent", "fixed"], nullable: true)
        discount(nullable: true)

        cooperationPrice(nullable: true)

        settlement(nullable: true)
        settlementDescription(nullable: true)

        refundable(inList: ["Yes", "No"], nullable: true)
        refundableDescription(nullable: true)

        testPeriod(inList: ["Yes", "No"], nullable: true)
        testPeriodDescription(nullable: true)

        deliveryPlace(nullable: true)
        transportationCost(nullable: true)
        addedValue(inList: ["Yes", "No", "Conditionally"], nullable: true)
        addedValueDescription(nullable: true)

    }
}
