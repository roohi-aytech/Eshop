package eshop

class ProductTypeType {
    String title
    byte[] image

    static belongsTo = [ProductType,Product]
    static constraints = {
        title()
        image(maxSize: 10000000,nullable: true)
    }
}
