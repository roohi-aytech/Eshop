package eshop

class PriceService {

    def calcProductPrice(productId) {
        def product = Product.get(productId)
        def now = new Date()
        def price = Price.findByProductAndStartDateLessThanEqualsAndEndDateIsNull(product, now)
        def addedValues = []
        addedValues.addAll(AddedValue.findAllByBaseProductAndProcessTime(product, "everyWhere"))
        product?.productTypes?.each {
            addedValues.addAll(getAddedvalues(it))
        }
        def priceVal = price?.rialPrice
        def mainVal = price?.rialPrice
        addedValues?.each {
            if (!it.variationValues) {
                def val
                if (it.type == "percent")
                    val = price.rialPrice * it.value/100
                else if (it.type == "fixed")
                    val = it.value
                priceVal += val
                if (val >= 0)
                    mainVal += val
            }
        }
        [mainVal: mainVal, showVal: priceVal]
    }

    def getAddedvalues(ProductType productType) {
        def addedValues = []
        if (productType.parentProduct)
            addedValues.addAll(getAddedvalues(productType.parentProduct))
        addedValues.addAll(AddedValue.findAllByBaseProductAndProcessTime(productType, "everyWhere"))
        addedValues
    }

    def calculateOrderPrice(Order order){
        Integer price = 0
        order.items.each {
            price += it.orderCount * it.unitPrice
        }

        price
    }
}
