package eshop

class ProductModel {
    static auditable = true
    String name
    Product product
    Guarantee guarantee
    String status
    Boolean isDefaultModel

    static searchable = {
        only = ['name','guarantee']
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
        variationValues(nullable: true)
        status(inList: ['exists', 'not-exists', 'coming-soon', 'inquiry-required'])
        isDefaultModel()
    }

    @Override
    int compareTo(def t) {
        name <=>t?.name
    }

    @Override
    String toString() {
        "${product?.productTypes?.find {true}?.name?:""} ${product?.type?.title?:""} ${product?.brand?.name?:""} ${variationValues?.find {it?.variationGroup?.representationType == 'Color'}?:""} مدل ${name?:""} با گارانتی ${guarantee?:""}"
    }
}
