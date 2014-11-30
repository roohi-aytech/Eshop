package eshop

class PricingLink {

    static auditable = true

    String name
    String url
    Product product
    String showType

    static constraints = {
        name(blank: false)
        url(blank: false)
        showType(nullable: true, inList: ['inline', 'iframe', 'window'])
    }
}
