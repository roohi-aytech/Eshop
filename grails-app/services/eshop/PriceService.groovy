package eshop

class PriceService {

    def calcProductPrice(productId) {
        def product = Product.get(productId)
        def defaultModel = ProductModel.findByProductAndIsDefaultModel(product, true)
        if (!defaultModel)
            return [mainVal: 0D, showVal: 0D, status: 'not-exists']

        if (defaultModel.status != 'exists') {
            def alternateModel = ProductModel.findByProductAndStatus(product, 'exists')
            if (alternateModel)
                defaultModel = alternateModel
        }

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
        addedValues.addAll(AddedValue.findAllByBaseProductAndProcessTime(productModel.product, "mandetory"))
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

//        def valueAddedVal = priceVal
        //addedValues - orderTime
//        addedValues = []
//        addedValues.addAll(AddedValue.findAllByBaseProductAndProcessTime(productModel.product, "orderTime"))
//        addedValues = addedValues.findAll { !it.brand || it.brand.id == productModel.product.brand.id }
//        productModel?.product?.productTypes?.each {
//            getOrderTimeAddedValues(it).each {
//                if (!it.brand || it.brand.id == productModel.product.brand.id)
//                    addedValues.add(it)
//            }
//        }

//        addedValues?.each {
//            if (!it.variationValues.any { !productModel.variationValues.contains(it) }) {
//                def val
//                if (it.type == "percent")
//                    val = priceVal * it.value / 100
//                else if (it.type == "fixed")
//                    val = it.value
//                valueAddedVal += val
//            }
//        }

        [mainVal: mainVal, showVal: priceVal, lastUpdate: price.startDate, status: productModel.status]
    }


    def calcProductModelPrice(productModelId, selectedAddedValues) {
        def result = calcProductModelPrice(productModelId)

        if (!result.mainVal)
            return result

        def valueAddedVal = result.showVal
        selectedAddedValues.collect { AddedValue.get(it.toLong()) }.each { addedValue ->
            def value = 0
            if (addedValue.type == "percent")
                value = result.mainVal * addedValue.value / 100
            else if (addedValue.type == "fixed")
                value = addedValue.value
            valueAddedVal += value
        }

        result.valueAddedVal = valueAddedVal

        result
    }

    def getAddedvalues(ProductType productType) {
        def addedValues = []
        if (productType.parentProduct)
            addedValues.addAll(getAddedvalues(productType.parentProduct))
        addedValues.addAll(AddedValue.findAllByBaseProductAndProcessTime(productType, "mandetory"))
        addedValues
    }



    def updateOrderPrice(Order order) {

        OrderItem.findAllByOrder(order).each { orderItem ->
            def price = calcProductModelPrice(orderItem.productModel.id, orderItem.addedValues?.collect { it.id })
            if (price.status == 'exists') {
                orderItem.baseUnitPrice = price.showVal ?: 0
                orderItem.addedValuesPrice = price.valueAddedVal ? price.valueAddedVal - price.showVal : 0
                orderItem.unitPrice = price.valueAddedVal ?: 0
                orderItem.totalPrice = orderItem.orderCount * orderItem.unitPrice
            } else
                orderItem.baseUnitPrice =
                    orderItem.addedValuesPrice =
                        orderItem.unitPrice =
                            orderItem.totalPrice = 0
            orderItem.save()
        }

        order.totalPrice = Math.round(((OrderItem.findAllByOrder(order).sum(0, { it.totalPrice }) as Integer) + order.deliveryPrice) / 1000) * 1000
        order.save()
    }

//    def getOrderTimeAddedValues(ProductType productType) {
//        def addedValues = []
//        if (productType.parentProduct)
//            addedValues.addAll(getAddedvalues(productType.parentProduct))
//        addedValues.addAll(AddedValue.findAllByBaseProductAndProcessTime(productType, "orderTime"))
//        addedValues
//    }
}
