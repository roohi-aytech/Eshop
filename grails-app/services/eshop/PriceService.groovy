package eshop

import eshop.discout.Discount
import eshop.discout.ProductCriteria
import grails.plugin.cache.Cacheable

class PriceService {

    @Cacheable(value='pservice', key='#productId.toString()')
    def calcProductPrice(productId) {
        def product = Product.get(productId)
        def defaultModel = ProductModel.findByProductAndIsDefaultModel(product, true)
        if (!defaultModel)
            return [showVal: 0D, status: 'not-exists']

        if (defaultModel.status != 'exists') {
            def alternateModel = ProductModel.findByProductAndStatus(product, 'exists')
            if (alternateModel)
                defaultModel = alternateModel
        }

        if (!defaultModel)
            return [showVal: 0D, status: 'not-exists']

        calcProductModelPrice(defaultModel?.id)
    }

    @Cacheable(value='pmservice', key='#productModelId.toString()')
    def calcProductModelPrice(productModelId) {
        def productModel = ProductModel.get(productModelId)
        if (!productModel)
            return [showVal: 0D, status: 'not-exists']
        def now = new Date()
        def price = Price.findByProductModelAndStartDateLessThanEqualsAndEndDateIsNull(productModel, now)
        if (!price)
            return [showVal: 0D, status: productModel.status]

        def priceVal = price?.rialPrice

        if (priceVal)
            AddedValue.findAllByBaseProductAndProcessTime(productModel.product, 'mandetory').each { addedValue ->
                if (addedValue.type == "percent")
                    priceVal += price?.rialPrice * addedValue.value / 100
                else if (addedValue.type == "fixed")
                    priceVal += addedValue.value
            }

        [showVal: priceVal, lastUpdate: price.startDate, status: productModel.status]
    }

    @Cacheable(value='pmmservice', key='#productModelId.toString().concat(#selectedAddedValues.join("-"))')
    def calcProductModelPrice(productModelId, selectedAddedValues) {
        def result = calcProductModelPrice(productModelId)

        if (!result.showVal)
            return result

        def addedVal = 0
        selectedAddedValues.collect { AddedValue.get(it.toLong()) }.findAll { it.processTime == 'optional' }.each { addedValue ->
            if (addedValue.type == "percent")
                addedVal += result.showVal * addedValue.value / 100
            else if (addedValue.type == "fixed")
                addedVal += addedValue.value
        }

        result.addedVal = addedVal

        result
    }

    def updateOrderPrice(Order order) {

        OrderItem.findAllByOrderAndDeleted(order, false).each { orderItem ->
            def price = calcProductModelPrice(orderItem.productModel.id, orderItem.addedValues?.collect { it.id })
            if (price.status == 'exists') {
                orderItem.baseUnitPrice = price.showVal ?: 0
                orderItem.addedValuesPrice = price.addedVal ?: 0
                orderItem.unitPrice = orderItem.baseUnitPrice + orderItem.addedValuesPrice
                orderItem.discount = 0
                orderItem.tax = 0
                orderItem.totalPrice = orderItem.orderCount * (orderItem.unitPrice - orderItem.discount + orderItem.tax)

            } else
                orderItem.deleted = true
        }

        OrderItem.findAllByOrderAndDeleted(order, false).each { orderItem ->

            def product = orderItem?.productModel?.product
            def productModel = ProductModel.get(orderItem?.productModel?.id)

            //set discount
            orderItem.discount = 0
            def discountList = Discount.findAllByFromDateLessThanEqualsAndToDateGreaterThanEqualsAndRemainCountGreaterThanEquals(new Date(), new Date(), 0)
            discountList = discountList.findAll { discount ->
                !discount.discountProductsCriteria.any { criteria -> !ProductCriteriaMatches(criteria, orderItem) } &&
                        order.items.any { basketItem ->
                            !discount.basketProductCriteria.any { criteria -> !ProductCriteriaMatches(criteria, basketItem) }
                        }
            }
            discountList?.each { discount ->
                if (discount.type == "Percent")
                    orderItem.discount += (orderItem.unitPrice * discount.value) / 100
                else if (discount.type == "Fixed")
                    orderItem.discount += discount.value
            }

            //set tax
            orderItem.tax = 0
            if (order.invoiceType == 'with_added_value') {
                def addedValues = []
                addedValues.addAll(AddedValue.findAllByBaseProduct(orderItem.productModel.product))
                Product.get(product?.id)?.productTypes?.each {
                    getAddedValues(it).each {
                        if (!it.brand || it.brand.id == product.brand.id)
                            addedValues.add(it)
                    }
                }
                addedValues?.each {
                    if (!it.variationValues.any { !productModel.variationValues.contains(it) }) {
                        if (it.type == "percent")
                            orderItem.tax += ((orderItem.unitPrice - orderItem.discount) * it.value) / 100
                        else if (it.type == "fixed")
                            orderItem.tax += it.value
                    }
                }
            }

            //total price
            orderItem.totalPrice = orderItem.orderCount * (orderItem.unitPrice - orderItem.discount + orderItem.tax)


            orderItem.save()
        }

        order.totalPrice = Math.round(((OrderItem.findAllByOrderAndDeleted(order, false).sum(0, { it.totalPrice }) as Integer) + order.deliveryPrice) / 1000) * 1000
        if (!order.usedAccountValue)
            order.usedAccountValue = 0
        order.totalPayablePrice = order.totalPrice - order.usedAccountValue
        order.save()
    }

    @Cacheable(value='advservice', key='#productType.id.toString()')
    def getAddedValues(ProductType productType) {
        def addedValues = []
        if (productType.parentProduct)
            addedValues.addAll(getAddedValues(productType.parentProduct))
        addedValues.addAll(AddedValue.findAllByBaseProduct(productType))
        addedValues
    }

    Boolean ProductCriteriaMatches(ProductCriteria criteria, OrderItem orderItem) {

        def result = true
        def product = Product.get(orderItem?.productModel?.product?.id)

        //check product
        result = result && (!criteria.product || criteria.product?.id == product.id)

        //check product type
        def productTypeList = [] as List<Long>
        product.productTypes.each { productType ->
            def item = productType
            productTypeList.add(item.id)
            while (item.parentProduct) {
                item = item.parentProduct
                productTypeList.add(item.id)
            }

        }
        result = result && (!criteria.productType || productTypeList?.contains(criteria.productType?.id))

        //brand
        result = result && (!criteria.brand || criteria.brand?.id == product.brand?.id)

        //price
        result = result && (!criteria.fromPrice || criteria.fromPrice <= orderItem.unitPrice)
        result = result && (!criteria.toPrice || criteria.toPrice >= orderItem.unitPrice)

        result
    }
}
