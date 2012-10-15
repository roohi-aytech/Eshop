package eshop

class Content {
    String name
    String contentType
    byte[] fileContent

    static mapping = {
        sort 'name'
    }

    static constraints = {
        name(blank: false)
        contentType(inList: ["image", "video"])
        fileContent(nullable: false,maxSize: 20000000)
    }

    String toString() {
        name
    }
}
