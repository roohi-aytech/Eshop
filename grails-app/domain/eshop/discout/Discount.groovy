package eshop.discout

import eshop.Content

class Discount {
    String type
    Double value
    String code
    Date fromDate
    Date toDate
    Integer remainCount
    String usageType
    byte[] image

    Integer basketCountMin
    Integer basketPriceMin
    Integer basketPriceMax

    static hasMany = [discountProductsCriteria: ProductCriteria, basketProductCriteria: ProductCriteria]

    static composites = ["discountProductsCriteria", "basketProductCriteria"]
    static constraints = {
        type(inList: ["Percent", "Fixed"])
        value(nullable: true)
        code(nullable: true)
        fromDate(nullable: true, persian: true)
        toDate(nullable: true, persian: true)
        remainCount(nullable: true)
        usageType(inList: ["General", "DiscountCard"])
        image(nullable: true, maxSize: 20000000)

        basketCountMin(nullable: true)
        basketPriceMin(nullable: true)
        basketPriceMax(nullable: true)
    }
}
