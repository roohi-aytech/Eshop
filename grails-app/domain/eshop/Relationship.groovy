package eshop

class Relationship {
    static auditable = true

    String title
    String sex
    Boolean deleted = false

    static constraints = {
        title()
        sex(nullable:true, inList: ['female', 'male'])
    }

    static mapping = {
        sort 'title'
    }

    String toString() {
        title
    }
}
