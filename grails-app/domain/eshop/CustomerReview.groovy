package eshop

class CustomerReview {

    Product product
    int rate
    String title
    String body
    Date creationDate
    Date lastUpdate
    User user

    static hasMany = [customerReviewReview: CustomerReview]

    static belongsTo = [Product]

    static searchable = true

    static mapping = {
        sort 'rate'
        customerReviewReview cascade: 'all'
        version false
    }

    static constraints = {
        product(nullable: false)
        rate(nullable: false, inList: [1..2])
        title(nullable: false, maxSize: 128)
        body(nullable: false, maxSize: 2048)
        creationDate(nullable: false)
        lastUpdate(nullable: false)
        user(nullable: false)
    }
}
