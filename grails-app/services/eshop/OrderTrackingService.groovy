package eshop

class OrderTrackingService {

    def filterOrderListForUser(java.util.List<Order> orderList, User user) {
        return orderList.findAll { checkIfOrderIsVisibleToUser(it, user) }
    }

    def findAllVendorsOfOrder(Order order){
        UserRole.findAllByRole(Role.findByAuthority(RoleHelper.ROLE_VENDOR))?.collect {it.user}?.findAll {checkIfOrderIsVisibleToUser(order, it)}
    }

    Boolean checkIfOrderIsVisibleToUser(Order order, User user) {
        Boolean result = false
        def vendors = Vendor.findAllByUserAndDeleted user, false
        vendors.each { vendor ->
            order.items.each { orderItem ->

                Boolean canContinueCheck = true
                //check brands
                if (vendor.brands?.count { it } > 0)
                    if (!vendor.brands.collect{it.id}.contains(orderItem?.productModel?.product?.brand?.id))
                        canContinueCheck = false;

                //check product type
                if (canContinueCheck) {
                    def productType = orderItem?.productModel?.product?.productTypes?.toArray()?.first()
                    while (productType) {
                        if (vendor.productType.id == productType.id)
                            result = true
                        productType = productType.parentProduct
                    }
                }
            }
        }
        return result
    }
}
