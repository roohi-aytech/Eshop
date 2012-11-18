package eshop

class PriceTagLib {
    static namespace = "eshop"
    def priceService
    def showPrice = {attrs, body ->
        out << render(template: "/site/price", model: priceService.calcProductPrice(attrs.productId))
    }
}
