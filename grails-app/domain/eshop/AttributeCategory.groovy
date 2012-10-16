package eshop

class AttributeCategory {
    String name
    AttributeCategory parentCategory
    ProductType productType

    static mapping = {
        sort 'name'
    }
    static constraints = {
    }
    String toString()
    {
        def parent = parentCategory?parentCategory.toString()+" > ":""
        parent+name
    }
}
