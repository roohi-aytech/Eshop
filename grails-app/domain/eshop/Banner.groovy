package eshop

class Banner {

    static auditable = true

    String name
    byte[] image
    String url
    String position
    int sortIndex
    int gridSortIndex
    Boolean deleted = false

    static constraints = {
        gridSortIndex()
        position(inList: ['right', 'left', 'mobile'])
        sortIndex()
        name()
        url(nullable: true)
        image(nullable: true, maxSize: 20000000)
    }
}
