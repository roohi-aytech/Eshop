package eshop

class NewsLetterInstance {

    static auditable = true

    NewsLetter newsLetter
    Date startDate
    Date finishDate
    String status

    static hasMany = [logs: NewsLetterLog]

    static constraints = {
        status inList: ['scheduled', 'started', 'finished', 'suspended']
        startDate nullable: true
        finishDate nullable: true
        newsLetter()
    }
}
