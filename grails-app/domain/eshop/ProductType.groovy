package eshop

class ProductType extends BaseProduct {
    static auditable = true
    String name
    String description
    String keywords
    String pageTitle
    String seoFriendlyName
    String seoFriendlyAlternativeName

    ProductType parentProduct
    ProductType rootProductType
    Long assetcategoryId
    Boolean deleted = false
    byte[] image
    byte[] menuImage
    String searchKeys

    transient Integer getChildrenCount() {
        def count = 0
        children.each { count += it.childrenCount + 1 }
        count
    }

    transient def getAllChildren() {
        def list = []
        children.each {
            list += it.getAllChildren()
            list << it
        }
        list
    }

    transient Integer getDepth() {
        parentProduct ? parentProduct.depth + 1 : 0
    }

    String getUrlName() {
        if (seoFriendlyName)
            return seoFriendlyName

        name
    }

    static searchable = [only: ['name']]

    static transients = ['urlName', 'searchString']

    static hasMany = [children: ProductType, godFathers: ProductType, products: Product, attributeTypes: AttributeType, types: ProductTypeType,addedValueTypes:AddedValueType]
    static belongsTo = [ProducingProduct, ProductTypeBrand]
    static mapping = {
        sort 'name'
        children cascade: 'all'
        products cascade: 'all'
        attributeTypes cascade: 'all'
        variations cascade: 'all'
        searchKeys type: 'text'
    }
    static mappedBy = [children: 'parentProduct', godFathers: 'godFathers']
    static constraints = {
        name()
        description(nullable: true)
        keywords(nullable: true)
        pageTitle(nullable: true)
        parentProduct(nullable: true)
        rootProductType(nullable: false)
        attributeTypes()
        assetcategoryId(nullable: true)
        seoFriendlyAlternativeName(nullable: true)
        seoFriendlyName(nullable: true)
        image(nullable: true, maxSize: 1000000000)
        menuImage(nullable: true, maxSize: 1000000000)
        deleted(nullable: true)
        searchKeys(nullable: true)
    }

    String getSearchString(){
        "${name} ${description} ${keywords} ${pageTitle} ${seoFriendlyName} ${seoFriendlyAlternativeName} ${searchKeys}"
    }

    @Override
    String toString() {
        name
    }
}
