package eshop.delivery

class DeliveryPricingRule {

    static auditable = true

    DeliveryTargetZone targetZone
    Double weightMin
    Double weightMax
    Double volumeMin
    Double volumeMax
    Double weightFactor
    Double volumeFactor
    Double netFactor
    String factorCalculationType

    Boolean deleted = false

    static belongsTo = [DeliveryTargetZone]

    static constraints = {
        weightMin(nullable: true)
        weightMax(nullable: true)
        volumeMin(nullable: true)
        volumeMax(nullable: true)
        weightFactor()
        volumeFactor()
        netFactor()
        factorCalculationType(inList: ['weight', 'volume', 'fixed', 'max', 'min'])
    }
}
