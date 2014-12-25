package eshop

class Product extends BaseProduct implements Comparable {
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
    Integer saleCount = 0
    Boolean isVisible = true
    Boolean deleted = false
    Boolean isSynchronized = false
//    Long assetId
//    Long dlFolderId
//    Long igFolderId
    Brand brand
    Content mainImage

    Double currentPrice

    String searchKeys

    Product copySource

    String getTitle() {
        toString()
    }

    String getBreadCrumb() {
        def result = ''
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

    transient def getGuaranteeList() {
        models?.collect { it.guarantee }?.unique { it?.id }
    }

    static transients = ['title', 'currentPrice', 'breadCrumb', 'searchString']

    static hasMany = [productTypes: ProductType, attributes: Attribute, images: Content, videos: Content, customerReviews: CustomerReview, specialSaleSlides: SpecialSaleSlide, models: ProductModel]

    static belongsTo = [ProductType]

    static searchable = {
        root true
        only = ['title', 'breadCrumb', 'description', 'details', 'variations', 'attributes', 'customerReviews', 'models', 'searchString']
        variations reference: [lazy: true]
        attributes reference: [lazy: true]
        customerReviews reference: [lazy: true]
        models reference: [lazy: true]
    }

    static mapping = {
        sort 'name'
//        attributes cascade: 'all'
        details type: "text"
        version false
        searchKeys type: 'text'
    }

    static constraints = {
        name(nullable: true)
        type(nullable: true)
        description(nullable: true, maxSize: 1000)
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
        manualTitle(nullable: true)
        length nullable: true
        width nullable: true
        height nullable: true
        visitCount(nullable: true)
        isVisible(nullable: true)
        deleted(nullable: true)
        searchKeys(nullable: true)
        copySource(nullable: true)
//        assetId(nullable: true)
//        dlFolderId(nullable: true)
//        igFolderId(nullable: true)
    }

    String getSearchString() {
        "${name} ${type} ${description} ${brand?.searchKeys} ${manufactureCountry} ${details} ${keywords} ${pageTitle} ${manualTitle} ${guaranteeList?.collect { it?.searchKeys ?: '' }?.join(' ')} ${productTypes?.collect { it?.searchKeys ?: '' }?.join(' ')} ${searchKeys}"
    }

    @Override
    int compareTo(def t) {
        name <=> t?.name
    }

    @Override
    String toString() {
        if (domainClass.grailsApplication.config.eShop.instance == 'goldaan') {
            return manualTitle ? pageTitle : "<span>${productTypes?.find { true }?.name ?: ""} ${type?.title ?: ""} ${brand?.name ?: ""}</span><br/> ${name ?: ""}"
        } else {
            return "${productTypes?.find { true }?.name ?: ""} ${type?.title ?: ""} ${brand?.name ?: ""}${name ? " مدل ${name}" : ""}"?.trim()
        }
    }
}
