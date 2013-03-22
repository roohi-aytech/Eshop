package eshop

class BasketController {

    def index() {}

    def add() {
        def id = params.id
        def product = Product.get(id)

        def basket = session.getAttribute("basket")
        if (!basket)
            basket = [];
        def basketItem = basket.find { it -> it.id == id }
        if (basketItem)
            basketItem.count++;
        else {
            basketItem = [id: id, name: product.name, count: 1]
            basket << basketItem
        }

        def basketCounter = 0
        basket.each { basketCounter += it.count }

        session.setAttribute("basketCounter", basketCounter)
        session.setAttribute("basket", basket)
        render "1"
    }

    def remove() {
        def id = params.id
        def product = Product.get(id)

        def basket = session.getAttribute("basket")
        if (!basket)
            render "basket is empty";
        basket = basket.findAll { it -> !(it.id == id) }

        def basketCounter = 0
        basket.each { basketCounter += it.count }

        session.setAttribute("basketCounter", basketCounter)
        session.setAttribute("basket", basket)
        render "1"
    }

    def show() {

    }
}
