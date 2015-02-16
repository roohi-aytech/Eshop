package eshop

class Testimonial {

    static auditable = true

    Customer writer
    String body
    String purchasedProduct
    String writerInfo
    Boolean approved = false
    User lastReviewer
    Date creationDate
    Date lastModifyDate

    static constraints = {
        writer()
        writerInfo nullable: true
        purchasedProduct nullable: true
        body maxSize: 200000
        approved()
        lastReviewer nullable: true
        creationDate()
        lastModifyDate()
    }
}
