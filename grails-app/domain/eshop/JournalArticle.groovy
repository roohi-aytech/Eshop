package eshop

class JournalArticle {
    static auditable = true
    String name
    String title
    String summary
    String keywords
    String text
    BaseProduct baseProduct
    static belongsTo = [BaseProduct]
    static mapping = {
        sort 'name'
        text type: "text"
    }
    static constraints = {
        name()
        title()
        summary(maxSize: 200000)
        keywords(maxSize: 200000)
        text()
    }
}
