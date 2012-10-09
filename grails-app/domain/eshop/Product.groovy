package eshop

class Product extends BaseProduct {
    String name
    String description
    String details
    Date manufactureDate
    String manufactureCountry
    String otherAtributes
    Double weight = 0D
//    Long assetId
//    Long dlFolderId
//    Long igFolderId
    Brand brand

    static hasMany = [productTypes: ProductType, attributes: Attribute, images: Content, videos: Content]

    static belongsTo = [ProductType]

    static mapping = {
        attributes cascade: 'all'
        details type: "text"
        version false
    }

    static constraints = {
        name()
        description(nullable: true)
        brand(nullable: true)
        manufactureCountry(nullable: true)
        manufactureDate(nullable: true)
        productTypes()
        attributes()
        otherAtributes(nullable: true)
        details(nullable: true)
        weight()
//        assetId(nullable: true)
//        dlFolderId(nullable: true)
//        igFolderId(nullable: true)
    }

    @Override
    String toString() {
        name
    }
}
