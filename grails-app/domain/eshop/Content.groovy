package eshop

class Content {
    String name
    String contentType
    byte[] fileContent

    static hasMany = [variationValues:VariationValue]

    static mapping = {
        sort 'name'
    }

    static constraints = {
        name(blank: false)
        contentType(inList: ["image", "video"])
        fileContent(nullable: false,maxSize: 20000000)
        variationValues()
    }

    String toString() {
        name
    }
}
