package eshop.delivery

class DeliveryMethod {

    static auditable = true

    String name
    String description
    Boolean insuranceIsRequired = false
    Double insurancePercent = 0D
    Double addedValuePercent = 0D
    Boolean hidePrice = false
    byte[] logo

    Boolean deleted = false

    static hasMany = [sourceStations: DeliverySourceStation]

    static mapping = {
        description type: "text"
    }

    static constraints = {
        name()
        description(nullable: true)
        sourceStations()
        insuranceIsRequired(nullable: true)
        insurancePercent(nullable: true)
        addedValuePercent(nullable: true)
        logo(nullable: true, maxSize: 20000000)
        hidePrice(nullable: true)
    }

    @Override
    String toString(){
        name
    }
}
