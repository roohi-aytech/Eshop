package eshop

class NewsLetter {

    static auditable = true

    String subject
    String body
    Date sendDate

    Boolean deleted = false

    static hasMany = [categories: NewsLetterCategory, productTypes: ProductType]

    static belongsTo = [NewsLetterCategory]

    static mapping = {
        body type: "text"
    }

    static constraints = {
        subject()
        productTypes()
        categories()
        sendDate(nullable: true, persian: true)
        body()
    }

    @Override
    String toString(){
        subject
    }
}
