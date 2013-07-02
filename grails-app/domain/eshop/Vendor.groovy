package eshop

class Vendor {

    static auditable = true

    User user
    ProductType productType
    Boolean deleted = false

    static belongsTo = [ProductType]

    static hasMany = [brands: Brand]

    static composites = ["brands"]

    static constraints = {
        user()
        brands()
        productType()
    }

    @Override
    String toString(){
        user.toString()
    }
}
