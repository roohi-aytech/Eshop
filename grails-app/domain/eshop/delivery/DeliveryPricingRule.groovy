package eshop.delivery

class DeliveryPricingRule {

    static auditable = true

    DeliveryTargetZone targetZone
    Double weightMin
    Double weightMax
    Double volumeMin
    Double volumeMax
    Double factor
    String type

    Boolean deleted = false

    static belongsTo = [DeliveryTargetZone]

    static constraints = {
        weightMin(nullable: true)
        weightMax(nullable: true)
        volumeMin(nullable: true)
        volumeMax(nullable: true)
        factor()
        type(inList: ['weight', 'volume', 'fixed'])
    }
}
