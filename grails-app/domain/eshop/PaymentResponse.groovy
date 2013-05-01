package eshop

class PaymentResponse {

    PaymentRequest request
    Date creationDate
    User owner
    Boolean approved
    String description

    static belongsTo = [PaymentRequest]
    Boolean deleted
    Integer indx
    static transients = ['deleted']

    static constraints = {
        approved()
        description(maxSize: 1024)
        creationDate(persian:true)
        owner()
    }

    static mapping = {
        sort 'creationDate'
    }
}
