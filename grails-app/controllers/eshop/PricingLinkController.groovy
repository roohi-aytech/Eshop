package eshop

import grails.converters.JSON

class PricingLinkController {

    def form() {
        def link
        if (params.id)
            link = PricingLink.get(params.id)
        else
            link = new PricingLink(params)
        render(template: "form", model: [link: link, 'productId': params.productId])
    }

    def save() {
        def link
        if (params.id) {
            link = PricingLink.get(params.id)
        } else
            link = new PricingLink()
        link.name = params.name
        link.url = params.url
        link.showType = params.showType
        link.product = Product.get(params.productId)
        if (link.validate() && link.save(flush:true)) {

            render link as JSON
        } else
            render(template: "form", model: [link: link])
    }

    def delete() {
        def link = PricingLink.get(params.id)
        link.delete(flush: true)
        render 0
    }

    def load(){
        def link = PricingLink.get(params.id)
        URI uri = new URI(link.url);
        [
                link: link,
                domain: uri.getHost()
        ]
    }
}
