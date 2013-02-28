package eshop

class GiftInformation {
    ProductType productType
    String gender
    Integer fromAge
    Integer toAge
    String type
    String usageType
    String job
    static hasMany = [cultureEvents: CultureEvent]

    static constraints = {
        fromAge(nullable: true)
        toAge(nullable: true)
        gender(nullable: true, inList: ["male", "female", "unimportant"])
        type(nullable: true, inList: ["simple", "sport", "classic", "traditional", "art"])
        usageType(nullable: true, inList: ["consumable", "persistent"])
        job(nullable: true, inList: ["office", "engineer", "market", "athlete"])
    }
}
