package eshop

class CultureEvent {
    static auditable = true
    String title
    static constraints = {
        title()
    }
    String toString(){
        title
    }
}
