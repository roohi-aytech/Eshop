package eshop

class Guarantee {
    static auditable = true

    String name
    String description
    String period
    byte[] logo
    String searchKeys

    static hasMany = [productTypeBrands: ProductTypeBrand]
 //   static composites = ["productTypeBrands"]

    static searchable = {
        only = ['name', 'description']
    }

    static mapping = {
        sort 'name'
        searchKeys type: 'text'
    //    productTypeBrands cascade: "all-delete-orphan"
    }

    static constraints = {
        name(nullable: true)
        period(nullable: true)
        description(nullable: true)
        logo(nullable: true,maxSize: 1000000000)
        searchKeys(nullable: true)

    }

    String toString(){
        name
    }

}
