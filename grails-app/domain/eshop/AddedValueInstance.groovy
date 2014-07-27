package eshop

class AddedValueInstance {
    AddedValue addedValue
    String description
    int count = 1
    OrderItem orderItem
    Content image
    static belongsTo = [AddedValue, OrderItem]
    static constraints = {
        addedValue()
        description(nullable: true)
        orderItem()
        image(nullable: true)
        count(nullable: true)
    }
}
