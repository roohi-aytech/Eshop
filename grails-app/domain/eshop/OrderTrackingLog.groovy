package eshop

class OrderTrackingLog {
    static auditable = true

    Order order
    User user
    String action
    Date date
    String title
    String description

    static belongsTo = [Order]

    static constraints = {
        order(nullable: false)
        user(nullable: true)
        action(nullable: false, inList: OrderHelper.ACTION_LIST)
        date(nullable: false)
        title(nullable: false)
        description(nullable: true, maxSize: 2048)
    }
}
