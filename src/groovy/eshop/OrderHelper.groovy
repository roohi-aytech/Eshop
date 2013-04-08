package eshop

/**
 * Created with IntelliJ IDEA.
 * User: Farzin
 * Date: 4/8/13
 * Time: 3:16 PM
 * To change this template use File | Settings | File Templates.
 */
class OrderHelper {

    public static final String STATUS_CREATED = "created";
    public static final String STATUS_PAID = "paid";
    public static final String STATUS_CANCELLED = "cancelled";
    public static final String STATUS_TRANSMITTED = "transmitted";
    public static final String STATUS_DELIVERED = "delivered";

    public static final def STATUS_LIST = [STATUS_CREATED, STATUS_PAID, STATUS_CANCELLED, STATUS_TRANSMITTED, STATUS_DELIVERED]

    public static final String ACTION_CREATION = "creation";
    public static final String ACTION_PAYMENT = "payment";
    public static final String ACTION_CANCELLATION = "cancellation";
    public static final String ACTION_TRANSMISSION = "transmission";
    public static final String ACTION_DELIVERY = "delivery";

    public static final def ACTION_LIST = [ACTION_CREATION, ACTION_PAYMENT, ACTION_CANCELLATION, ACTION_TRANSMISSION, ACTION_DELIVERY]
}
