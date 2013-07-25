package eshop

class Relationship {
    static auditable = true

    String title;
    Boolean deleted = false

    static constraints = {
    }

    static mapping = {
        sort 'title'
    }

    String toString() {
        title
    }
}
