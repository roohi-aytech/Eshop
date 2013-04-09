package eshop

class City {
    String title;
    Province province;

    static constraints = {
        title(nullable: false)
        province(nullable: false)
    }
}
