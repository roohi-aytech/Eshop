package eshop

class MenuConfig {

    ProductType productType
    String column1
    String column2
    String column3
    String column4
    String column5
    String column6

    static constraints = {
        column1 nullable: true, maxSize: 2000000
        column2 nullable: true, maxSize: 2000000
        column3 nullable: true, maxSize: 2000000
        column4 nullable: true, maxSize: 2000000
        column5 nullable: true, maxSize: 2000000
        column6 nullable: true, maxSize: 2000000
    }
}
