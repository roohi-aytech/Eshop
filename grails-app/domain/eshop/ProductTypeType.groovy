package eshop

class ProductTypeType {
    String title
    static belongsTo = [ProductType,Product]
    static constraints = {
        title()

    }
}
