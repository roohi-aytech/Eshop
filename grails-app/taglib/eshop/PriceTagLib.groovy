package eshop

class PriceTagLib {
    static namespace = "eshop"
    def priceService
    def accountingService
    def showPrice = { attrs, body ->
        out << render(template: "/site/price", model: priceService.calcProductPrice(attrs.productId))
    }

    def thumbnailPrice = { attrs, body ->
        def price
        if (attrs.productModelId) {
            price = priceService.calcProductModelPrice(attrs.productModelId)
            if (price.status != 'exists' && session['status_filter']) {
                def productModel = ProductModel.get(attrs.productModelId)
                out << eshop.synchronizeProduct(productId: [id: productModel?.product?.id, modelId: attrs.productModelId])
            }
        } else {
            price = priceService.calcProductPrice(attrs.productId)
            if (price.status != 'exists' && session['status_filter']) {
                out << eshop.synchronizeProduct(productId: [id: attrs.productId])
            }
        }

        price.hideLastUpdate = attrs.hideLastUpdate
        out << render(template: "/site/thumbnailPrice", model: price)
        if (attrs.flag)
            out << render(template: "/site/common/productModelStatusFlag", model: price)

    }

    def thumbnailOldPrice = { attrs, body ->
        def newPrice
        def price
        if (attrs.productModelId) {
            newPrice = priceService.calcProductModelPrice(attrs.productModelId)
            price = priceService.calcProductModelOldPrice(attrs.productModelId)
        } else {
            newPrice = priceService.calcProductPrice(attrs.productId)
            price = priceService.calcProductOldPrice(attrs.productId)
        }
        if (newPrice.showVal < price.showVal) {
            out << "${message(code: 'oldPrice')}"
            out << "<span>"
            out << render(template: "/site/thumbnailPrice", model: price + [hideLastUpdate: true])
            out << "</span>"
        }

    }

    def statusFlag = { attrs, body ->
        out << render(template: "/site/common/productModelStatusFlag", model: priceService.calcProductPrice(attrs.productId))
    }

    def currencyLabel = { attrs, body ->
        def currency = Currency.findByDisplay(true)
        if (currency)
            out << currency?.name
        else
            out << message(code: 'rial')
    }

    def accountValue = { attrs, body ->
        out << "${g.formatNumber(number: accountingService.calculateCustomerAccountValue(Customer.findByUsername(sec.username())) / priceService.getDisplayCurrencyExchangeRate(), type: 'number')} ${eshop.currencyLabel()}"
    }
}
