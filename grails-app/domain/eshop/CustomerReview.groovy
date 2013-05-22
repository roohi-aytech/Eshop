package eshop

class CustomerReview {
    static auditable = true

    Product product
    int rate
    String title
    String body
    Date creationDate
    Date lastUpdate
    User user

    static hasMany = [customerReviewReview: CustomerReview]

    static belongsTo = [Product]

    static searchable = {
//        root false
        only = ['title','body']
    }

    static mapping = {
        sort 'rate'
        customerReviewReview cascade: 'all'
        version false
    }

    static constraints = {
        product(nullable: false)
        rate(nullable: false)
        title(nullable: false, maxSize: 128)
        body(nullable: false, maxSize: 2048)
        creationDate(nullable: false)
        lastUpdate(nullable: false)
        user(nullable: false)
    }
}
