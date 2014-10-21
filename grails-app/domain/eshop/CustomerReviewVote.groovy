package eshop

class CustomerReviewVote {

    CustomerReview customerReview
    Integer value
    User user

    static belongsTo = [CustomerReview]

    static constraints = {
        value inList: [-1, 1]
    }
}
