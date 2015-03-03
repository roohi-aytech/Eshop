package eshop.goldaan

import eshop.Product

class SpecialProducts {
    String type
    Product product
    static constraints = {
        type(inList: ['specialOffer','firstPageProducts'])
    }
}
