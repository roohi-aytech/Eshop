package eshop

class PriceTagLib {
    static namespace = "eshop"
    def priceService

    def showPrice = { attrs, body ->
        out << render(template: "/site/price", model: priceService.calcProductPrice(attrs.productId))
    }

    def thumbnailPrice = { attrs, body ->
        def price
        if (attrs.productModelId)
            price = priceService.calcProductModelPrice(attrs.productModelId)
        else
            price = priceService.calcProductPrice(attrs.productId)
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
        out << Currency.findByDisplay(true)?.name ?: message(code: 'rial')
    }
}
