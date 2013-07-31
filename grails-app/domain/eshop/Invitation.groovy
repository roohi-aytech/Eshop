package eshop

class Invitation {
    static auditable = true

    String receiverAddress
    String provider
    Date sendDate
    String subject
    String body
    String identifier
    Boolean visitRecorded = false
    Boolean registrationRecorded = false
    Customer sender

    static mapping = {
        body type: "text"
    }

    static constraints = {
        receiverAddress nullable: true
        provider()
        sendDate()
        subject nullable: true
        body nullable: true
        identifier unique: true
        sender()
        visitRecorded nullable: true
        registrationRecorded nullable: true
    }

    def beforeInsert(){
        identifier = UUID.randomUUID().toString()
    }
}
