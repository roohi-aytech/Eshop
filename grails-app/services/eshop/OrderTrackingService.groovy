package eshop

class OrderTrackingService {

    def filterOrderListForUser(User user, String status) {
//        orderList.findAll { checkIfOrderIsVisibleToUser(it, user) }

        def vendors = Vendor.findAllByUserAndDeleted user, false
        def brandsList = []
        vendors.each { brandsList.addAll(it.brands.collect { it.id }) }
        def productTypeList = []
        vendors.each {
            productTypeList << it.productType.id
            productTypeList.addAll(BrowseHelper.getAllSubProductTypes(it.productType).collect { it.id })
        }
        return Order.createCriteria().listDistinct({
            if (status?.toLowerCase() != 'all') {
                eq('status', status)
            }
            items {
                eq('deleted', false)
                if(brandsList || productTypeList) {
                    productModel {
                        product {
                            if (brandsList?.size() > 0) {
                                brand {
                                    'in'('id', brandsList)
                                }
                            }
                            productTypes {
                                'in'('id', productTypeList)
                            }
                        }
                    }
                }
            }
            projections {
                property('id')
                maxResults(500)
            }
            order('id', 'desc')
        })
    }

    def findAllVendorsOfOrder(Order order) {
        UserRole.findAllByRole(Role.findByAuthority(RoleHelper.ROLE_VENDOR))?.collect { it.user }?.findAll {
            checkIfOrderIsVisibleToUser(order, it)
        }
    }

    Boolean checkIfOrderIsVisibleToUser(Order order, User user) {
        Boolean result = false
        def vendors = Vendor.findAllByUserAndDeleted user, false
        vendors.each { vendor ->
            order.items.findAll { !it.deleted }.each { orderItem ->

                Boolean canContinueCheck = true
                //check brands
                if (vendor.brands?.count { it } > 0)
                    if (!vendor.brands.collect { it.id }.contains(orderItem?.productModel?.product?.brand?.id))
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
