package eshop

class ProducerStaff {
    static auditable = true
    StaffRole role
    String sex
    String name
    String lastName
    String phoneNumber
    String fax
    String mobile
    String emailAddress
    String secretary

    Producer producer

    static belongsTo =  Producer

    Boolean deleted

    static transients = ['deleted']

    static mapping = {
        sort 'name'
    }

    static constraints = {
        role()
        sex(inList: ["male", "female"], nullable: true)
        name()
        lastName(nullable: true)
        phoneNumber(nullable: true)
        fax(nullable: true)
        mobile(nullable: true)
        emailAddress(nullable: true)
        secretary(nullable: true)
    }

    String toString() {
        role
    }
}
