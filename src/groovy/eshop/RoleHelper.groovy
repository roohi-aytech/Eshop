package eshop

/**
 * Created with IntelliJ IDEA.
 * User: roohi
 * Date: 9/18/12
 * Time: 7:04 PM
 * To change this template use File | Settings | File Templates.
 */
class RoleHelper {
    public static final String ROLE_USER = "ROLE_USER";
    public static final String ROLE_USER_ADMIN = "ROLE_USER_ADMIN";
    public static final String ROLE_PRODUCT_ADMIN = "ROLE_PRODUCT_ADMIN";
    public static final String ROLE_PRODUCT_TYPE_ADMIN = "ROLE_PRODUCT_TYPE_ADMIN";
    public static final String ROLE_PRICE_ADMIN = "ROLE_PRICE_ADMIN";
    public static final String ROLE_CUSTOMER = "ROLE_CUSTOMER";
    public static final String ROLE_PRODUCT_ADD = "ROLE_PRODUCT_ADD";
    public static final String ROLE_PRODUCT_ADD_EDIT = "ROLE_PRODUCT_ADD_EDIT";
    public static final String ROLE_PRODUCER_ADD = "ROLE_PRODUCER_ADD";
    public static final String ROLE_PRODUCER_ADD_EDIT = "ROLE_PRODUCER_ADD_EDIT";
    public static final def visibleRoles = [ROLE_USER_ADMIN, ROLE_PRICE_ADMIN, ROLE_PRODUCT_ADMIN, ROLE_PRODUCT_TYPE_ADMIN, ROLE_PRODUCER_ADD, ROLE_PRODUCER_ADD_EDIT, ROLE_PRODUCT_ADD, ROLE_PRODUCT_ADD_EDIT]

}
