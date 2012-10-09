package eshop

class ProductType extends BaseProduct {
    String name
    String description
    ProductType parentProduct
    ProductType rootProductType
    Long assetcategoryId

    static hasMany = [children: ProductType, godFathers: ProductType, products: Product, attributeTypes: AttributeType]

    static mapping = {
        children cascade: 'all'
        products cascade: 'all'
        attributeTypes cascade: 'all'
        variations cascade: 'all'
    }
    static mappedBy = [children: 'parentProduct', godFathers: 'godFathers']
    static constraints = {
        name()
        description(nullable: true)
        parentProduct(nullable: true)
        rootProductType(nullable: false)
        attributeTypes()
        assetcategoryId(nullable: true)
    }

    @Override
    String toString() {
        name
    }
}
