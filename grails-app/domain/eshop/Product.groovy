package eshop
class Product extends BaseProduct implements Comparable{
    static auditable = true
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
    Double length
    Double width
    Double height
    Integer visitCount = 0
    Boolean isVisible = true
    Boolean deleted =false
//    Long assetId
//    Long dlFolderId
//    Long igFolderId
    Brand brand
    Content mainImage

    Double currentPrice

    String getTitle() {
        toString()
    }

    String getBreadCrumb() {
        def result
        def type
        if (productTypes?.count { it } > 0)
            type = productTypes?.toArray()?.first()
        while (type) {
            if (result)
                result = type.toString() + " - " + result
            else
                result = type.toString()
            type = type.parentProduct
        }
        result
    }

//    ProductType getProductType() {
//        productTypes?.count {it} > 0 ? productTypes?.toArray()?.first() : null
//    }

    static transients = ['title', 'currentPrice', 'breadCrumb']

    static hasMany = [productTypes: ProductType, attributes: Attribute, images: Content, videos: Content, customerReviews: CustomerReview, specialSaleSlides: SpecialSaleSlide, models: ProductModel]

    static belongsTo = [ProductType]

    static searchable = {
        root true
        only = ['title', 'breadCrumb', 'description', 'details', 'variations', 'attributes', 'customerReviews', 'models']
//
//        only: ['name', 'title', 'breadCrumb', 'description', 'details', 'manufactureCountry', 'otherAtributes', 'keywords', 'pageTitle', 'manualTitle']
//
//        title boost: 2.5
//        breadCrumb boost: 0.5
//
        variations reference:[lazy:true]
        attributes reference:[lazy:true]
        customerReviews reference:[lazy:true]
        models reference:[lazy:true]
    }

    static mapping = {
        sort 'name'
//        attributes cascade: 'all'
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
        length nullable: true
        width nullable: true
        height nullable: true
        visitCount(nullable:true)
        isVisible(nullable: true)
        deleted(nullable: true)
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
