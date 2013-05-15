package eshop

class SpecialSaleSlide {
    static auditable = true

    Product product
    Date startDate
    Date finishDate
    int totalCount
    int remainingCount
    int price
    byte[] image1024
    byte[] image1280
    byte[] image1440

    static constraints = {
        product(nullable: false)
        startDate(nullable:false, persian: true)
        finishDate(nullable:false, persian: true)
        totalCount(nullable:false)
        remainingCount(nullable:false)
        image1024(nullable: false, maxSize: 20000000)
        image1280(nullable: false, maxSize: 20000000)
        image1440(nullable: false, maxSize: 20000000)
    }
}
