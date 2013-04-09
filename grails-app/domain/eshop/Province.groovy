package eshop

class Province {
    String title;

    static hasMany = [cities: City]

    static constraints = {
        title(nullable: false)
    }
}
