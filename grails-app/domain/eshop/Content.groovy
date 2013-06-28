package eshop

class Content {
    static auditable = true
    String name
    String contentType
    byte[] fileContent
    Map dynamicProperties = [:]

    static transients = ['dynamicProperties']

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
