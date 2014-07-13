package eshop

class ProductModel {
    static auditable = true
    String name
    Product product
    Guarantee guarantee
    String status
    Boolean isDefaultModel
    Integer width
    Integer height

    static searchable = {
//        root true
        only = ['name','guaranteeInfo']
    }

    static hasMany = [variationValues: VariationValue, prices: Price]

    static composites = ["prices"]

    static mapping = {
        sort 'id'
        prices cascade: "all-delete-orphan"
    }

    static constraints = {
        name(nullable: true)
        guarantee(nullable:true)
        variationValues(nullable: true)
        status(inList: ['exists', 'not-exists', 'coming-soon', 'inquiry-required'])
        isDefaultModel()
        prices()
        width(nullable: true)
        height(nullable: true)
    }

    transient String getGuaranteeInfo(){
        "${guarantee?.name} ${guarantee?.description}"
    }

    @Override
    int compareTo(def t) {
        name <=>t?.name
    }

    @Override
    String toString() {
        "${product?.productTypes?.find {true}?.name?:""} ${product?.type?.title?:""} ${product?.brand?.name?:""} ${variationValues?.find {it?.variationGroup?.representationType == 'Color'}?:""} مدل ${name?:""} با گارانتی ${guarantee?:""}"
    }

    String toBasketItemString(){
        "${product?.productTypes?.find {true}?.name?:""} ${product?.type?.title?:""} ${product?.brand?.name?:""} ${variationValues?.find {it?.variationGroup?.representationType == 'Color'}?:""} با گارانتی ${guarantee?:""}<br/> مدل ${name?:""}"
    }
}
