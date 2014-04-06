package eshop

class PriceTagLib {
    static namespace = "eshop"
    def priceService

    def showPrice = { attrs, body ->
        out << render(template: "/site/price", model: priceService.calcProductPrice(attrs.productId))
    }

    def thumbnailPrice = { attrs, body ->
        def price = priceService.calcProductPrice(attrs.productId)
        price.hideLastUpdate = attrs.hideLastUpdate
        out << render(template: "/site/thumbnailPrice", model: price)
        if (attrs.flag)
            out << render(template: "/site/common/productModelStatusFlag", model: price)

    }

    def thumbnailOldPrice = { attrs, body ->
        def newPrice = priceService.calcProductPrice(attrs.productId)
        def price = priceService.calcProductOldPrice(attrs.productId)
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
}
