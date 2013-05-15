package eshop

class City {
    static auditable = true
    String title;
    Province province;


    static belongsTo = [Province]
    Boolean deleted
    Integer indx
    static transients = ['deleted']

    static constraints = {
        title(nullable: false)
        province(nullable: false)
    }

    static mapping = {
        sort 'title'
    }

    String toString() {
        title
    }
}
