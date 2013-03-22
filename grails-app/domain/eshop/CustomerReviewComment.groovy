package eshop

class CustomerReviewComment {

    CustomerReview review
    int rate
    User user

    static belongsTo = [CustomerReview]

    static constraints = {
        rate(nullable: false, inList: [-1, 1])
        review(nullable: false)
    }
}
