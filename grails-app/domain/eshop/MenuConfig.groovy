package eshop

class MenuConfig {

    ProductType productType
    String column1
    String column2
    String column3
    String column4
    String column5
    String column6
    byte[] extraMenuImage1
    byte[] extraMenuImage2
    byte[] extraMenuImage3
    byte[] extraMenuImage4
    byte[] extraMenuImage5
    Integer maxBrandsCount

    static constraints = {
        column1 nullable: true, maxSize: 2000000
        column2 nullable: true, maxSize: 2000000
        column3 nullable: true, maxSize: 2000000
        column4 nullable: true, maxSize: 2000000
        column5 nullable: true, maxSize: 2000000
        column6 nullable: true, maxSize: 2000000
        extraMenuImage1 nullable: true, maxSize: 1000000000
        extraMenuImage2 nullable: true, maxSize: 1000000000
        extraMenuImage3 nullable: true, maxSize: 1000000000
        extraMenuImage4 nullable: true, maxSize: 1000000000
        extraMenuImage5 nullable: true, maxSize: 1000000000
        maxBrandsCount nullable: true
    }
}
