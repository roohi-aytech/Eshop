package eshop

class BasketController {
    def springSecurityService
    def priceService

    def index() {}

    def add() {
        def id = params.id
        def productModel = ProductModel.get(id)

        def basket = session.getAttribute("basket")
        if (!basket)
            basket = [];
        def basketItem = basket.find { it -> it.id == id }
        if (basketItem)
            basketItem.count++;
        else {
            def price = priceService.calcProductModelPrice(productModel.id)
            basketItem = [id: id, productId: productModel.product.id, name: productModel.toString(), count: 1, price: price.showVal, realPrice:price.valueAddedVal]
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

    def checkout() {
        [
                'basket': session.getAttribute("basket"),
                'customer': springSecurityService.currentUser
        ]
    }

    def changeCount() {
        def id = params.id

        def basket = session.getAttribute("basket")
        if (!basket)
            basket = [];

        def basketItem = basket.find { it -> it.id == id }
        if (basketItem)
            basketItem.count = params.count.toInteger();

        render "1"
    }

    def invoice() {

        Order order = new Order()
        order.ownerName = params.ownerName
        order.ownerEmail = params.ownerEmail
        order.ownerMobile = params.ownerMobile
        order.ownerTelephone = params.ownerTelephone
        session["order"] = order

        Address sendingAddress = new Address()
        sendingAddress.addressLine1 = params.addressLine1
        sendingAddress.postalCode = params.postalCode1
        sendingAddress.telephone = params.telephone1
        sendingAddress.city = City.get(params.city1)
        session["sendingAddress"] = sendingAddress

        Address billingAddress = new Address()
        billingAddress.addressLine1 = params.addressLine2
        billingAddress.postalCode = params.postalCode2
        billingAddress.telephone = params.telephone2
        billingAddress.city = City.get(params.city2)
        session["billingAddress"] = billingAddress

        [
                basket: session.getAttribute("basket"),
                order: order,
                sendingAddress: sendingAddress,
                billingAddress: billingAddress
        ]
    }

    def shop() {

    }
}
