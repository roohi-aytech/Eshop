package eshop

import eshop.discout.Discount
import eshop.discout.ProductCriteria
import grails.plugin.cache.Cacheable

class PriceService {
    def grailsApplication

    @Cacheable(value = 'pservice', key = '#productId.toString()')
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

    @Cacheable(value = 'pmservice', key = '#productModelId.toString()')
    def calcProductModelPrice(productModelId) {
        def productModel = ProductModel.get(productModelId)
        if (!productModel)
            return [showVal: 0D, status: 'not-exists']
        def now = new Date()
        if (productModel.lastcalcDate && productModel.lastcalcPrice && productModel.lastpriceUpdate) {
            def cal = Calendar.instance
            cal.add(Calendar.MINUTE, -10)
            if (cal.time.before(productModel.lastcalcDate)) {
                return [showVal: productModel.lastcalcPrice, lastUpdate: productModel.lastpriceUpdate, status: productModel.status]
            }
        }
        def price = Price.findByProductModelAndStartDateLessThanEqualsAndEndDateIsNull(productModel, now)
        if (!price)
            return [showVal: 0D, status: productModel.status]

        def priceVal = price?.rialPrice / getDisplayCurrencyExchangeRate()
        if (priceVal)
            AddedValue.findAllByBaseProductAndProcessTimeAndDeletedNotEqual(productModel.product, 'mandetory', true).each { addedValue ->
                if (!addedValue.variationValues.any { v1 -> !productModel.variationValues.any { v2 -> v1.id == v2.id } }) {
                    if (addedValue.type == "percent")
                        priceVal += (price?.rialPrice * addedValue.value) / (100 * getDisplayCurrencyExchangeRate())
                    else if (addedValue.type == "fixed")
                        priceVal += addedValue.value
                }
            }
        try {
            Thread.start {
                try {
                    synchronized (productModelId) {
                        ProductModel.withTransaction {
                            def pm = ProductModel.get(productModelId)
                            pm.lastcalcPrice = priceVal
                            pm.lastcalcDate = new Date()
                            pm.lastpriceUpdate = price.startDate
                            pm.save()
                        }
                        println "Success Updating price for cache ${productModel.id}"
                    }
                } catch (x) {
                    println "ERROR Updating price for cache ${productModel.id}"
                }

            }

        } catch (x) {
        }
        [showVal: priceVal, lastUpdate: price.startDate, status: productModel.status]
    }

    @Cacheable(value = 'pmmservice', key = '#productModelId.toString().concat(#selectedAddedValues.toString())')
    def calcProductModelPrice(productModelId, selectedAddedValues, defaultPrice = 0D) {
        def result = calcProductModelPrice(productModelId)

        if (!result.showVal)
            return result

        def addedVal = 0
        selectedAddedValues.each {
            def addedValue

            if (it.toString().isNumber())
                addedValue = AddedValue.get(it.toString().toLong())
            if (addedValue) {
                if (addedValue.processTime == 'optional') {
                    if (addedValue.type == "percent")
                        addedVal += result.showVal * addedValue.value / 100
                    else if (addedValue.type == "fixed")
                        addedVal += addedValue.value
                }
            } else
                addedVal += defaultPrice

        }

        result.addedVal = addedVal

        result
    }

    @Cacheable(value = 'poservice', key = '#productId.toString()')
    def calcProductOldPrice(productId) {
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

        calcProductModelOldPrice(defaultModel?.id)
    }

    @Cacheable(value = 'pmoservice', key = '#productModelId.toString()')
    def calcProductModelOldPrice(productModelId) {
        def productModel = ProductModel.get(productModelId)
        if (!productModel)
            return [showVal: 0D, status: 'not-exists']
        def now = new Date()
        def price = Price.findByProductModelAndStartDateLessThanEqualsAndEndDateIsNull(productModel, now)
        if (price) {
            def oldPriceList = Price.findAllByProductModelAndStartDateLessThanEqualsAndEndDateIsNotNull(productModel, price.startDate)
            price = oldPriceList.find { it.startDate >= oldPriceList.collect { it.startDate }.max() }
        }
        if (!price)
            return [showVal: 0D, status: productModel.status]

        def priceVal = price?.rialPrice / getDisplayCurrencyExchangeRate()

        if (priceVal)
            AddedValue.findAllByBaseProductAndProcessTimeAndDeletedNotEqual(productModel.product, 'mandetory', true).each { addedValue ->
                if (!addedValue.variationValues.any { v1 -> !productModel.variationValues.any { v2 -> v1.id == v2.id } }) {
                    if (addedValue.type == "percent")
                        priceVal += (price?.rialPrice * addedValue.value) / (100 * getDisplayCurrencyExchangeRate())
                    else if (addedValue.type == "fixed")
                        priceVal += addedValue.value
                }
            }

        [showVal: priceVal, lastUpdate: price.startDate, status: productModel.status]
    }

    @Cacheable(value = 'pmmoservice', key = '#productModelId.toString().concat(#selectedAddedValues.toString())')
    def calcProductModelOldPrice(productModelId, selectedAddedValues) {
        def result = calcProductModelOldPrice(productModelId)

        if (!result.showVal)
            return result

        def addedVal = 0
        selectedAddedValues.collect { AddedValue.get(it.toLong()) }.findAll {
            it.processTime == 'optional'
        }.each { addedValue ->
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
            def addedValues = []
            if (orderItem.addedValues)
                addedValues.addAll(orderItem.addedValues?.collect { it.id })
            if (orderItem.addedValueInstances)
                addedValues.addAll(orderItem.addedValueInstances?.collect { it.addedValue.id })
            def price = calcProductModelPrice(orderItem.productModel.id, addedValues)
            if (price.status == 'exists') {
                if (orderItem.externalDiscount) {
                    orderItem.baseUnitPrice = 0
                    orderItem.addedValuesPrice = price.addedVal ?: 0
                    orderItem.unitPrice = orderItem.baseUnitPrice + orderItem.addedValuesPrice
                    orderItem.discount = 0
                    orderItem.tax = 0
                    orderItem.totalPrice = orderItem.orderCount * (orderItem.unitPrice - orderItem.discount + orderItem.tax)
                } else {

                    orderItem.baseUnitPrice = price.showVal ?: 0
                    orderItem.addedValuesPrice = price.addedVal ?: 0
                    orderItem.unitPrice = orderItem.baseUnitPrice + orderItem.addedValuesPrice
                    orderItem.discount = 0
                    orderItem.tax = 0
                    orderItem.totalPrice = orderItem.orderCount * (orderItem.unitPrice - orderItem.discount + orderItem.tax)
                }

            } else
                orderItem.deleted = true
        }

        OrderItem.findAllByOrderAndDeleted(order, false).each { orderItem ->

            def product = orderItem?.productModel?.product
            def productModel = ProductModel.get(orderItem?.productModel?.id)

            //set discount
            orderItem.discount = 0
            def discountList = Discount.findAllByFromDateLessThanEqualsAndToDateGreaterThanEqualsAndRemainCountGreaterThanEqualsAndUsageTypeNotEqual(new Date(), new Date(), 0, 'Bon')
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
                addedValues.addAll(AddedValue.findAllByBaseProductAndDeletedNotEqual(orderItem.productModel.product, true))
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

        if (grailsApplication.config.disableRoundingPrices) {
            order.totalPrice = Math.round(((OrderItem.findAllByOrderAndDeleted(order, false).sum(0, {
                it.totalPrice
            }) as Integer) + order.deliveryPrice))
        } else {
            order.totalPrice = Math.round(((OrderItem.findAllByOrderAndDeleted(order, false).sum(0, {
                it.totalPrice
            }) as Integer) + order.deliveryPrice) / 1000) * 1000
        }
        if (order.usedAccountValue)
            order.usedAccountValue = Math.min(order.usedAccountValue, order.totalPrice)
        else
            order.usedAccountValue = 0
        order.totalPayablePrice = order.totalPrice - order.usedAccountValue
        order.save()
    }

    @Cacheable(value = 'advservice', key = '#productType.id.toString()')
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

    int getDisplayCurrencyExchangeRate() {
        Currency.findByDisplay(true)?.exchangeRate?.intValue() ?: 1
    }

    //todo this implementation is incomplete
    @Cacheable(value = 'findDiscounts', key = '#discountType.toString().concat(#basketPrice.toString()).concat(#basketCount.toString())')
    def findDiscounts(discountType, basketPrice, basketCount) {
        def discounts = Discount.createCriteria().list {
            eq('usageType', discountType)
            if (basketPrice) {
                or {
                    isNull('basketPriceMin')
                    le('basketPriceMin', basketPrice as Integer)
                }
                or {
                    isNull('basketPriceMax')
                    ge('basketPriceMax', basketPrice as Integer)
                }
            }
            if (basketCount) {
                or {
                    isNull('basketCountMin')
                    le('basketCountMin', basketCount)
                }

            }
        }
        def discount = 0
        discounts.each {
            if (it.type == 'Fixed')
                discount += it.value
            if (it.type == 'Percent')
                discount += (it.value * basketPrice / 100)
        }
        return discount
    }
}
