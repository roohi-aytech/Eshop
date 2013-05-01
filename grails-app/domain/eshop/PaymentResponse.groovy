package eshop

class PaymentResponse {

    PaymentRequest request
    Date creationDate
    User owner
    Boolean approved
    String description

    static constraints = {
    }
}
