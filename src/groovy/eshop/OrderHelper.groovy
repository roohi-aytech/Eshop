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
    public static final String STATUS_UPDATING = "updating";
    public static final String STATUS_INQUIRED = "inquired";
    public static final String STATUS_PAID = "paid";
//    public static final String STATUS_CANCELLED = "cancelled";
    public static final String STATUS_TRANSMITTED = "transmitted";
    public static final String STATUS_DELIVERED = "delivered";
    public static final String STATUS_INCORRECT = "incorrect";
    public static final String STATUS_INCOMPLETE = "incomplete";

    public static final def STATUS_LIST = [STATUS_CREATED, STATUS_INCORRECT, STATUS_UPDATING, STATUS_INQUIRED, STATUS_INCOMPLETE, STATUS_PAID, STATUS_TRANSMITTED, STATUS_DELIVERED]

    public static final String ACTION_CREATION = "creation";
    public static final String ACTION_INQUIRY = "inquiry";
    public static final String ACTION_PAYMENT = "payment";
//    public static final String ACTION_CANCELLATION = "cancellation";
    public static final String ACTION_TRANSMISSION = "transmission";
    public static final String ACTION_DELIVERY = "delivery";
//    public static final String ACTION_REACTIVATION = "reactivation";
    public static final String ACTION_MARK_AS_INCORRECT = "markAsIncorrect";
    public static final String ACTION_MARK_AS_INCOMPLETE = "markAsIncomplete";
    public static final String ACTION_APPROVE = "approve";

    public static final def ACTION_LIST = [ACTION_CREATION, ACTION_MARK_AS_INCORRECT, ACTION_APPROVE, ACTION_INQUIRY, ACTION_MARK_AS_INCOMPLETE, ACTION_PAYMENT, ACTION_TRANSMISSION, ACTION_DELIVERY]
}
