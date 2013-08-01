package eshop

class OrderItem {
    static auditable = true

    Order order
    ProductModel productModel
    int orderCount
    int baseUnitPrice = 0
    int addedValuesPrice = 0
    int unitPrice = 0
    int totalPrice = 0


    static belongsTo = [Order]

    static hasMany = [addedValues: AddedValue]

    static constraints = {
        order()
        productModel()
        orderCount()
    }

    String toString(){
        productModel.toString()
    }
}
