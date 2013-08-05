package eshop

class NewsLetterLog {

    NewsLetterInstance newsLetterInstance
    Customer customer
    Date sendDate
    String status
    String errorMessage
    String stackTrace

    static mapping = {
        stackTrace type: 'text'
    }

    static constraints = {
        customer()
        sendDate nullable: true
        status inList: ['scheduled', 'sent', 'error']
        errorMessage nullable: true
        stackTrace nullable: true
        newsLetterInstance()
    }
}
