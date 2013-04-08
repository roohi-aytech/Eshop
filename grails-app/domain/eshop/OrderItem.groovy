package eshop

class OrderItem {

    Order order
    Product product
    int orderCount

    static belongsTo = [Order]

    static constraints = {
        order(nullable: false)
        product(nullable: false)
        orderCount(nullable: false)
    }
}
