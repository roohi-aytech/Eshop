package eshop

class ProducerStaff {
    //1.3.	اطلاعات افراد (سمت/ نام/ تلفن/ فکس/ تلفن همراه/ایمیل/مسئول دفتر)
    String role
    String name
    String lastName
    int phoneNumber
    int fax
    int mobile
    String emailAddress
    String secretary

   // Producer producer
    static belongsTo =  Producer

    Boolean deleted
    Integer indx

    static transients = ['deleted']

    static mapping = {
        sort 'name'
    }

    static constraints = {
        lastName(nullable: true)
        phoneNumber(nullable: true)
        fax(nullable: true)
        mobile(nullable: true)
        emailAddress(nullable: true)
        secretary(nullable: true)
    }

    String toString() {
        name
    }
}
