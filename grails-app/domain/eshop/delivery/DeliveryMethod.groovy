package eshop.delivery

class DeliveryMethod {

    static auditable = true

    String name
    String description
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
        logo(nullable: true, maxSize: 20000000)
    }

    @Override
    String toString(){
        name
    }
}
