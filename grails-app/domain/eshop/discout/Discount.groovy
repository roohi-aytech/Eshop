package eshop.discout

import eshop.Content

class Discount {
    static auditable = true
    String type
    Double value
    String code
    Date fromDate
    Date toDate
    Integer remainCount
    String usageType
    byte[] image1024
    byte[] image1280
    byte[] image1440

    Integer basketCountMin
    Integer basketPriceMin
    Integer basketPriceMax

    static hasMany = [discountProductsCriteria: ProductCriteria, basketProductCriteria: ProductCriteria]



    static constraints = {
        type(inList: ["Percent", "Fixed"])
        value(nullable: true)
        code(nullable: true)
        fromDate(nullable: true, persian: true)
        toDate(nullable: true, persian: true)
        remainCount(nullable: true)
        usageType(inList: ["General", "DiscountCard","Bon"])
        image1024(nullable: true, maxSize: 20000000)
        image1280(nullable: true, maxSize: 20000000)
        image1440(nullable: true, maxSize: 20000000)

        basketCountMin(nullable: true)
        basketPriceMin(nullable: true)
        basketPriceMax(nullable: true)
    }
}
