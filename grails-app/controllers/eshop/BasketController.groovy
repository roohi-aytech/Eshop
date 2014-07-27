package eshop

import eshop.delivery.DeliveryMethod
import eshop.delivery.DeliverySourceStation

class BasketController {
    def springSecurityService
    def priceService
    def deliveryService

    def index() {}

    def add() {
        def count = 1
        if (params.count)
            count = params.count as Integer
        def id = params.id
        def productModel = ProductModel.get(id)
        if (params.type == 'product') {
            def product = Product.get(id)
            productModel = ProductModel.findByProductAndIsDefaultModel(product, true)
            if (productModel?.prices?.count { it } == 0)
                productModel = ProductModel.findAllByProduct(product).find { it?.prices?.count { it } > 0 }
        }

        def basket = session.getAttribute("basket")
        if (!basket)
            basket = [];
        def basketItem = basket.find { it -> it.id == id }
        if (basketItem)
            basketItem.count = basketItem.count + count;
        else {
            basketItem = [id: id, productId: productModel.product.id, name: productModel.toBasketItemString(), count: count]
            basket << basketItem
        }

        if (params.addedValues) {
            basketItem.selectedAddedValues = params.addedValues?.toString().split(',')
            basketItem.selectedAddedValueNames = basketItem.selectedAddedValues.collect {
                AddedValue.get(it.toLong()).name
            }
        } else {
            basketItem.selectedAddedValues = []
            basketItem.selectedAddedValueNames = []
        }
        def price = priceService.calcProductModelPrice(productModel.id, basketItem.selectedAddedValues)
        basketItem.price = price.showVal
        basketItem.realPrice = price.showVal + price.addedVal


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
        if (grailsApplication.config.customCheckout) {
            def customer = springSecurityService.currentUser as Customer
            def view = "/site/${grailsApplication.config.eShop.instance}/checkout"
            def currentStep = 1

            def customInvoiceInformation = [:]
            customInvoiceInformation.ownerName = message(code: "customer.title.${customer ? customer.sex : session.checkout_customerInformation?.sex}") + ' ' +
                    (customer ? customer.toString() : session.checkout_customerInformation?.lastName)
            customInvoiceInformation.ownerCode = customer ? customer.nationalCode : session.checkout_customerInformation?.ownerCode
            customInvoiceInformation.ownerMobile = customer ? customer.mobile : session.checkout_customerInformation?.mobile

            def deliveryMethods = DeliveryMethod.list().sort { it.name }
            def addedValueTypes = AddedValueType.list().sort { it.title }
            session['currentStep'] = currentStep
            render(model: [
                    basket                  : session.getAttribute("basket"),
                    customer                : customer,
                    currentStep             : currentStep,
                    address                 : session.checkout_address,
                    customInvoiceInformation: customInvoiceInformation,
                    addedValueTypes         : addedValueTypes,
                    deliveryMethods         : deliveryMethods
            ], view: view)
        } else {
            def customer = springSecurityService.currentUser as Customer
            if (!customer && !session.checkout_customerInformation && session.getAttribute("basket")?.size() > 0)
                session.forwardUri = createLink(controller: 'basket', action: 'checkout')
            else
                session.forwardUri = null

            def currentStep = 1

            if (customer || session.checkout_customerInformation)
                currentStep = 2

            if (session.checkout_address)
                currentStep = 3

            def customInvoiceInformation = [:]
            customInvoiceInformation.ownerName = message(code: "customer.title.${customer ? customer.sex : session.checkout_customerInformation?.sex}") + ' ' +
                    (customer ? customer.toString() : session.checkout_customerInformation?.lastName)
            customInvoiceInformation.ownerCode = customer ? customer.nationalCode : session.checkout_customerInformation?.ownerCode
            customInvoiceInformation.ownerMobile = customer ? customer.mobile : session.checkout_customerInformation?.mobile

            def deliveryMethods = []

            if (session.checkout_customInvoiceInformation) {
                customInvoiceInformation = session.checkout_customInvoiceInformation
                currentStep = 4

                //setup delivery methods
                Order order = new Order()
                order.ownerName = customer ? message(code: "customer.title.${customer ? customer.sex : session.checkout_customerInformation?.sex}") + ' ' + customer.toString() : session.checkout_customerInformation.lastName
                order.ownerEmail = customer ? customer.email : session.checkout_customerInformation.email
                order.ownerMobile = customer ? customer.mobile : session.checkout_customerInformation.mobile
                order.ownerTelephone = customer ? customer.telephone : session.checkout_customerInformation.telephone
                order.ownerCode = customer ? customer.nationalCode : session.checkout_customInvoiceInformation.ownerCode
                order.ownerSex = customer ? customer.sex : session.checkout_customerInformation.sex

                order.useAlternateInformation = session.checkout_customInvoiceInformation.customInvoiceInfo
                order.alternateOwnerCode = session.checkout_customInvoiceInformation.ownerCode
                order.alternateOwnerMobile = session.checkout_customInvoiceInformation.ownerMobile
                order.alternateOwnerName = session.checkout_customInvoiceInformation.ownerName

                session["order"] = order

                Address sendingAddress = new Address()
                sendingAddress.addressLine1 = session.checkout_address.addressLine1
                sendingAddress.postalCode = session.checkout_address.postalCode
                sendingAddress.telephone = session.checkout_address.telephone
                sendingAddress.city = City.get(session.checkout_address.city.id)
                session["sendingAddress"] = sendingAddress

                Address billingAddress = new Address()
                billingAddress.addressLine1 = session.checkout_address.addressLine1
                billingAddress.postalCode = session.checkout_address.postalCode
                billingAddress.telephone = session.checkout_address.telephone
                billingAddress.city = City.get(session.checkout_address.city.id)
                session["billingAddress"] = billingAddress

                order.sendingAddress = sendingAddress
                order.billingAddress = billingAddress

                def basket = session.getAttribute("basket")
                basket.each() { basketItem ->
                    def orderItem = new OrderItem()
                    orderItem.productModel = ProductModel.get(basketItem.id)
                    orderItem.order = order
                    orderItem.orderCount = basketItem.count
                    orderItem.unitPrice = basketItem.realPrice
                    order.addToItems(orderItem)
                }

                deliveryMethods = deliveryService.findAllDeliveryMethods(order)
            }
            def view = 'checkout'

            render(model: [
                    basket                  : session.getAttribute("basket"),
                    customer                : customer,
                    currentStep             : currentStep,
                    address                 : session.checkout_address,
                    customInvoiceInformation: customInvoiceInformation,
                    deliveryMethods         : deliveryMethods
            ], view: view)
        }
    }

    def deliveryMethods() {
        def deliveryMethods = []

        def customer = springSecurityService.currentUser as Customer

        if (session.checkout_customInvoiceInformation) {
            def customInvoiceInformation = session.checkout_customInvoiceInformation
            def currentStep = 4

            //setup delivery methods
            Order order = new Order()
            order.ownerName = customer ? message(code: "customer.title.${customer ? customer.sex : session.checkout_customerInformation?.sex}") + ' ' + customer.toString() : session.checkout_customerInformation.lastName
            order.ownerEmail = customer ? customer.email : session.checkout_customerInformation.email
            order.ownerMobile = customer ? customer.mobile : session.checkout_customerInformation.mobile
            order.ownerTelephone = customer ? customer.telephone : session.checkout_customerInformation.telephone
            order.ownerCode = customer ? customer.nationalCode : session.checkout_customInvoiceInformation.ownerCode
            order.ownerSex = customer ? customer.sex : session.checkout_customerInformation.sex

            order.useAlternateInformation = session.checkout_customInvoiceInformation.customInvoiceInfo
            order.alternateOwnerCode = session.checkout_customInvoiceInformation.ownerCode
            order.alternateOwnerMobile = session.checkout_customInvoiceInformation.ownerMobile
            order.alternateOwnerName = session.checkout_customInvoiceInformation.ownerName

            session["order"] = order

            Address sendingAddress = new Address()
            sendingAddress.addressLine1 = session.checkout_address.addressLine1
            sendingAddress.postalCode = session.checkout_address.postalCode
            sendingAddress.telephone = session.checkout_address.telephone
            sendingAddress.city = City.get(session.checkout_address.city.id)
            session["sendingAddress"] = sendingAddress

            Address billingAddress = new Address()
            billingAddress.addressLine1 = session.checkout_address.addressLine1
            billingAddress.postalCode = session.checkout_address.postalCode
            billingAddress.telephone = session.checkout_address.telephone
            billingAddress.city = City.get(session.checkout_address.city.id)
            session["billingAddress"] = billingAddress

            order.sendingAddress = sendingAddress
            order.billingAddress = billingAddress

            def basket = session.getAttribute("basket")
            basket.each() { basketItem ->
                def orderItem = new OrderItem()
                orderItem.productModel = ProductModel.get(basketItem.id)
                orderItem.order = order
                orderItem.orderCount = basketItem.count
                orderItem.unitPrice = basketItem.realPrice
                order.addToItems(orderItem)
            }

            deliveryMethods = deliveryService.findAllDeliveryMethods(order)
            render template: 'checkout/delivery_method', model: [deliveryMethods: deliveryMethods]
        }

        render ''
    }

    def changeCount() {
        def id = params.id

        def basket = session.getAttribute("basket")
        if (!basket)
            basket = [];

        def basketItem = basket.find { it -> it.id == id }
        if (basketItem)
            basketItem.count = params.count.toInteger();


        def basketCounter = 0
        basket.each { basketCounter += it.count }

        session.setAttribute("basketCounter", basketCounter)

        render "1"
    }

    def deliveryMethod() {

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

        order.sendingAddress = sendingAddress
        order.billingAddress = billingAddress

        def basket = session.getAttribute("basket")
        basket.each() { basketItem ->
            def orderItem = new OrderItem()
            orderItem.productModel = ProductModel.get(basketItem.id)
            orderItem.order = order
            orderItem.orderCount = basketItem.count
            orderItem.unitPrice = basketItem.realPrice
            order.addToItems(orderItem)
        }

        def deliveryMethods = deliveryService.findAllDeliveryMethods(order)

        [
                deliveryMethods: deliveryMethods
        ]
    }

    def invoice() {

        def order = session.getAttribute("order") as Order
        order.deliverySourceStation = DeliverySourceStation.get(params.deliverySourceStation);
        order.deliveryPrice = params.price.toDouble()
        order.optionalInsurance = params["insurance${order.deliverySourceStation?.id}"]
        session["order"] = order

        [
                basket        : session.getAttribute("basket"),
                order         : session.getAttribute("order"),
                sendingAddress: session.getAttribute("sendingAddress"),
                billingAddress: session.getAttribute("billingAddress")
        ]
    }

    def storeCustomerInformationWithoutRegistration() {
        def customerInformation = [:]
        customerInformation.lastName = params.lastName
        customerInformation.sex = params.sex
        customerInformation.email = params.email
        customerInformation.mobile = params.mobile
        customerInformation.telephone = params.telephone
        session.checkout_customerInformation = customerInformation
        redirect(action: 'checkout')
    }

    def checkoutAddress() {
        def model = [:]
        if (params.addressIsSameAsProfile?.toBoolean()) {
            model.address = (springSecurityService.currentUser as Customer).address
        }
        render template: 'checkout/address', model: model
    }

    def storeShippingAddress() {
        def address = [:]
        address.city = City.get(params.city)
        address.postalCode = params.postalCode
        address.telephone = params.telephone
        address.addressLine1 = params.addressLine
        session.checkout_address = address
        redirect(action: 'checkout')
    }

    def storeCustomInvoiceInformation() {
        def customer = springSecurityService.currentUser as Customer
        def customInvoiceInformation = [:]
        customInvoiceInformation.customInvoiceInfo = params.customInvoiceInfo == 'true'
        customInvoiceInformation.ownerName = customInvoiceInformation.customInvoiceInfo ?
                params.ownerName :
                (customer ? message(code: "customer.title.${customer.sex}") + " " + customer.toString() :
                        message(code: "customer.title.${session.checkout_customerInformation.sex}") + " " + session.checkout_customerInformation.lastName)
        customInvoiceInformation.ownerCode = customInvoiceInformation.customInvoiceInfo ? params.ownerCode : (customer ? customer.nationalCode : session.checkout_customerInformation?.ownerCode)
        customInvoiceInformation.ownerMobile = customInvoiceInformation.customInvoiceInfo ? params.ownerMobile : (customer ? customer.mobile : session.checkout_customerInformation.mobile)
        session.checkout_customInvoiceInformation = customInvoiceInformation
        redirect(action: 'checkout')
    }

    def shop() {

    }

    def alert() {

        def id = params.id
        def productModel = ProductModel.get(id)

        render template: 'alert', model: [name: productModel?.product?.manualTitle ? productModel?.product?.pageTitle : ("${productModel?.product?.productTypes?.find()} ${productModel?.product?.type?.title ?: ''} ${productModel?.product?.brand} ${productModel?.variationValues?.find { it.variationGroup.representationType == 'Color' }?.value}")]
    }
}
