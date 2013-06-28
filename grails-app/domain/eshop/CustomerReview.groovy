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
    CustomerReview parentReview
    String status

    Integer getTotalVotes() {
        if (votes?.count { it } > 0)
            return votes.sum(0, { it.value }) as Integer
        else
            return 0
    }

    static transients = ['totalVotes']

    static hasMany = [customerReviewReviews: CustomerReview, votes: CustomerReviewVote]

    static belongsTo = [Product]

    static searchable = {
//        root false
        only = ['title', 'body']
    }

    static mapping = {
        sort 'rate'
        customerReviewReviews cascade: 'all'
        votes cascade: 'all'
        version false
    }

    static constraints = {
        product(nullable: false)
        title(nullable: false, maxSize: 1024)
        rate(nullable: false)
        creationDate(nullable: false)
        user(nullable: false)
        parentReview(nullable: true)
        status inList: ['waiting', 'approved', 'rejected']
        body(nullable: false, maxSize: 200000)
        lastUpdate(nullable: false)
    }

    @Override
    String toString() {
        title
    }
}
