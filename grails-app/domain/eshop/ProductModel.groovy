package eshop

class ProductModel {
    String name
    Product product
    Guarantee guarantee
    String status
    Boolean isDefaultModel

    static searchable = {
        name boost: 2.0
        guarantee component:true
    }

    static hasMany = [variationValues: VariationValue, prices: Price]

    static composites = ["prices"]

    static mapping = {
        sort 'id'
        prices cascade: "all-delete-orphan"
    }

    static constraints = {
        name(nullable: true)
        guarantee()
        variationValues()
        status(inList: ['exists', 'not-exists', 'coming-soon'])
        isDefaultModel()
    }

    @Override
    int compareTo(def t) {
        name <=>t?.name
    }

    @Override
    String toString() {
        "${product?.productTypes?.find {true}?.name?:""} ${product?.type?.title?:""} ${product?.brand?.name?:""} مدل ${name?:""}"
    }
}
