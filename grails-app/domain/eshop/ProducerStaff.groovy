package eshop

class ProducerStaff {
    //1.3.	اطلاعات افراد (سمت/ نام/ تلفن/ فکس/ تلفن همراه/ایمیل/مسئول دفتر)
    String role
    String sex
    String name
    String lastName
    String phoneNumber
    String fax
    String mobile
    String emailAddress
    String secretary

    static belongsTo =  Producer

    Boolean deleted
    Integer indx

    static transients = ['deleted']

    static mapping = {
        sort 'name'
    }

    static constraints = {
        role()
        sex()
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
