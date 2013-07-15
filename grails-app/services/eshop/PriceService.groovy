package eshop

class PriceService {

    def calcProductPrice(productId) {
        def product = Product.get(productId)
        def defaultModel = ProductModel.findByProductAndIsDefaultModel(product, true)
        if (!defaultModel)
            return [mainVal: 0D, showVal: 0D, status: 'not-exists']

        if (defaultModel.status != 'exists')
            defaultModel = ProductModel.findByProductAndStatus(product, 'exists')

        if (!defaultModel)
            return [mainVal: 0D, showVal: 0D, status: 'not-exists']

        calcProductModelPrice(defaultModel?.id)
    }

    def calcProductModelPrice(productModelId) {
        def productModel = ProductModel.get(productModelId)
        if (!productModel)
            return [mainVal: 0D, showVal: 0D, status: 'not-exists']
        def now = new Date()
        def price = Price.findByProductModelAndStartDateLessThanEqualsAndEndDateIsNull(productModel, now)
        if (!price)
            return [mainVal: 0D, showVal: 0D, status: productModel.status]

        def priceVal = price?.rialPrice
        def mainVal = price?.rialPrice

        //addedValues - everyWhere
        def addedValues = []
        addedValues.addAll(AddedValue.findAllByBaseProductAndProcessTime(productModel.product, "everyWhere"))
        addedValues = addedValues.findAll { !it.brand || it.brand.id == productModel.product.brand.id }
        productModel?.product?.productTypes?.each {
            getAddedvalues(it).each {
                if (!it.brand || it.brand.id == productModel.product.brand.id)
                    addedValues.add(it)
            }
        }

        addedValues?.each {
            if (!it.variationValues.any { !productModel.variationValues.contains(it) }) {
                def val
                if (it.type == "percent")
                    val = price.rialPrice * it.value / 100
                else if (it.type == "fixed")
                    val = it.value
                priceVal += val
            }
        }

        def valueAddedVal = priceVal
        //addedValues - orderTime
        addedValues = []
        addedValues.addAll(AddedValue.findAllByBaseProductAndProcessTime(productModel.product, "orderTime"))
        addedValues = addedValues.findAll { !it.brand || it.brand.id == productModel.product.brand.id }
        productModel?.product?.productTypes?.each {
            getOrderTimeAddedValues(it).each {
                if (!it.brand || it.brand.id == productModel.product.brand.id)
                    addedValues.add(it)
            }
        }

        addedValues?.each {
            if (!it.variationValues.any { !productModel.variationValues.contains(it) }) {
                def val
                if (it.type == "percent")
                    val = priceVal * it.value / 100
                else if (it.type == "fixed")
                    val = it.value
                valueAddedVal += val
            }
        }

        [mainVal: mainVal, showVal: priceVal, valueAddedVal: valueAddedVal, lastUpdate: price.startDate, status: productModel.status]
    }

    def getAddedvalues(ProductType productType) {
        def addedValues = []
        if (productType.parentProduct)
            addedValues.addAll(getAddedvalues(productType.parentProduct))
        addedValues.addAll(AddedValue.findAllByBaseProductAndProcessTime(productType, "everyWhere"))
        addedValues
    }

    def getOrderTimeAddedValues(ProductType productType) {
        def addedValues = []
        if (productType.parentProduct)
            addedValues.addAll(getAddedvalues(productType.parentProduct))
        addedValues.addAll(AddedValue.findAllByBaseProductAndProcessTime(productType, "orderTime"))
        addedValues
    }

    def calculateOrderPrice(Order order) {
        Integer price = order.deliveryPrice ?: 0
        order.items.each {
            price += it.productModel.status == 'exists' ? it.orderCount * it.unitPrice : 0
        }

        price
    }
}
