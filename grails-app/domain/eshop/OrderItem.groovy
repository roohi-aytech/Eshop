package eshop

class OrderItem {
    static auditable = true

    Order order
    ProductModel productModel
    int orderCount
    int baseUnitPrice = 0
    int addedValuesPrice = 0
    int discount = 0
    int tax = 0
    int unitPrice = 0
    int totalPrice = 0
    Boolean deleted = false

    static belongsTo = [Order]

    static hasMany = [addedValues: AddedValue]

    static constraints = {
        order(nullable: true)
        productModel()
        orderCount()
        deleted(nullable: true)
        tax nullable:true
        discount nullable:true
        baseUnitPrice nullable:true
        addedValuesPrice nullable:true
        unitPrice nullable:true
        totalPrice nullable:true
    }

    String toString(){
        productModel.toString()
    }
}
