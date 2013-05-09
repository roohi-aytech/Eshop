package eshop

class OrderItem {

    Order order
    ProductModel productModel
    int orderCount
    int unitPrice = 0

    static belongsTo = [Order]

    static constraints = {
        order()
        productModel()
        orderCount()
    }
}
