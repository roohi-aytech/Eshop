package eshop

class ProductType extends BaseProduct {
    String name
    String description
    String keywords
    String pageTitle
    ProductType parentProduct
    ProductType rootProductType
    Long assetcategoryId
    byte[] image

    static hasMany = [children: ProductType, godFathers: ProductType, products: Product, attributeTypes: AttributeType]

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
        image(nullable: true,maxSize: 1000000000)

    }

    @Override
    String toString() {
        name
    }
}
