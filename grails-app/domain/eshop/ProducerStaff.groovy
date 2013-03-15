package eshop

class ProducerStaff {
    //1.3.	اطلاعات افراد (سمت/ نام/ تلفن/ فکس/ تلفن همراه/ایمیل/مسئول دفتر)
  //  String role
    String value
   /* String lastName
    int phoneNumber
    int fax
    int mobile
    String emailAddress
    String secretary     */

    Producer producer
    static belongsTo =  Producer

    Boolean deleted
    Integer indx

    static transients = ['deleted']

    static mapping = {
        sort 'value'
    }

    static constraints = {
    }

    String toString() {
        value
    }
}
