package eshop

class PricingLink {

    static auditable = true

    String name
    String url
    Product product

    static constraints = {
        name(blank: false)
        url(blank: false)
    }
}
