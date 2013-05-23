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
    Boolean deleted=false
    byte[] image

//    static searchable = {
//        root false
//        only: ['id']
//    }
//        name boost:0.5
//        only:['name','description', 'keywords']
//    }

    static hasMany = [children: ProductType, godFathers: ProductType, products: Product, attributeTypes: AttributeType, types: ProductTypeType]
    static belongsTo = [ProducingProduct, ProductTypeBrand]
    static mapping = {
        sort 'name'
        children cascade: 'all'
        products cascade: 'all'
        attributeTypes cascade: 'all'
        variations cascade: 'all'
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
        deleted(nullable: true)
    }

    @Override
    String toString() {
        name
    }
}
