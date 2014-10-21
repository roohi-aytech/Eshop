package eshop

class AddedValueInstance {
    AddedValue addedValue
    String description
    String from
    int orderCount = 1
    OrderItem orderItem
    Content image
    static belongsTo = [AddedValue, OrderItem]
    static mapping = {
        from column: 'from_person'
    }
    static constraints = {
        addedValue()
        description(nullable: true)
        orderItem()
        from(nullable:true)
        image(nullable: true)
        orderCount(nullable: true)
    }
}
