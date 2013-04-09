package eshop

class OrderTrackingLog {

    Order order
    User user
    String action
    Date date
    String title

    static belongsTo = [Order]

    static constraints = {
        order(nullable: false)
        user(nullable: false)
        action(nullable: false, inList: OrderHelper.ACTION_LIST)
        date(nullable: false)
        title(nullable: false)
    }
}
