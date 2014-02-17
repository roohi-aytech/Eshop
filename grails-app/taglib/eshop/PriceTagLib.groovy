package eshop

class PriceTagLib {
    static namespace = "eshop"
    def priceService

    def showPrice = {attrs, body ->
        out << render(template: "/site/price", model: priceService.calcProductPrice(attrs.productId))
    }

    def thumbnailPrice = {attrs, body ->
        def price = priceService.calcProductPrice(attrs.productId)
        out << render(template: "/site/thumbnailPrice", model: price)
        if(attrs.flag)
            out << render(template: "/site/common/productModelStatusFlag", model: price)

    }

    def statusFlag = {attrs, body ->
        out << render(template: "/site/common/productModelStatusFlag", model: priceService.calcProductPrice(attrs.productId))
    }
}
