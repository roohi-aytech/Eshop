package eshop

class JournalArticle {
    String name
    String summary
    String text
    BaseProduct baseProduct
    static belongsTo = [BaseProduct]
    static mapping = {
        sort 'name'
        text type: "text"
    }
    static constraints = {
        name()
        summary()
        text()
    }
}
