package eshop

class NewsLetterCategory {

    static auditable = true

    String name
    Boolean deleted = false

    static hasMany = [newsLetters: NewsLetter]

    static constraints = {
        name()
        newsLetters()
    }

    @Override
    String toString(){
        name
    }
}
