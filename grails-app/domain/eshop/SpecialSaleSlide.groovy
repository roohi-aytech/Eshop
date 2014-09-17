package eshop

class SpecialSaleSlide {
    static auditable = true

    Product product
    Date startDate
    Date finishDate
    int totalCount
    int remainingCount
    int price
    byte[] image
    byte[] extraImage1
    byte[] extraImage2
    byte[] extraImage3
    String extraLink1
    String extraLink2
    String extraLink3
    Boolean visibleOnFirstPage = false

    static hasMany = [productTypes: ProductType]

    static constraints = {
        product(nullable: false)
        startDate(nullable:false, persian: true)
        finishDate(nullable:false, persian: true)
        totalCount(nullable:false)
        remainingCount(nullable:false)
        image(maxSize: 20000000)
        extraImage1(maxSize: 20000000)
        extraImage2(maxSize: 20000000)
        extraImage3(maxSize: 20000000)
        extraLink1(nullable: true, maxSize: 2048)
        extraLink2(nullable: true, maxSize: 2048)
        extraLink3(nullable: true, maxSize: 2048)
        visibleOnFirstPage(nullable: true)
    }
}
