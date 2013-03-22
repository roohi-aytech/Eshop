package eshop
class Product extends BaseProduct implements Comparable{
    String name
    ProductTypeType type
    String description
    String details
    String manufactureDate
    String manufactureCountry
    String otherAtributes
    Double weight = 0D
    String keywords
    String pageTitle
    Boolean manualTitle
    String iranCode
    String shabnamCode
//    Long assetId
//    Long dlFolderId
//    Long igFolderId
    Brand brand
    Content mainImage

    static hasMany = [productTypes: ProductType, attributes: Attribute, images: Content, videos: Content, customerReviews: CustomerReview]

    static belongsTo = [ProductType]

    static searchable = true

    static mapping = {
        sort 'name'
        attributes cascade: 'all'
        customerReviews cascade: 'all'
        details type: "text"
        version false
    }

    static constraints = {
        name(nullable: true)
        type(nullable: true)
        description(nullable: true,maxSize: 1000)
        brand(nullable: true)
        manufactureCountry(nullable: true)
        manufactureDate(nullable: true)
        productTypes()
        attributes()
        otherAtributes(nullable: true)
        details(nullable: true)
        weight(nullable: true)
        keywords(nullable: true)
        pageTitle(nullable: true)
        mainImage(nullable: true)
        iranCode(nullable: true)
        shabnamCode(nullable: true)
        manualTitle(nullable:true)

//        assetId(nullable: true)
//        dlFolderId(nullable: true)
//        igFolderId(nullable: true)
    }

    @Override
    int compareTo(def t) {
        name <=>t?.name
    }

    @Override
    String toString() {
        "${productTypes?.find {true}?.name?:""} ${type?.title?:""} ${brand?.name?:""} مدل ${name?:""}"
    }
}
