package eshop

import eshop.delivery.DeliveryMethod
import eshop.delivery.DeliverySourceStation
import fi.joensuu.joyds1.calendar.JalaliCalendar
import grails.converters.JSON

class BasketController {
    def springSecurityService
    def priceService
    def deliveryService
    def accountingService

    def index() {
        session['currentStep'] = 1
        def customer = springSecurityService.currentUser as Customer
        def accountValue = customer ? (accountingService.calculateCustomerAccountValue(customer) / priceService.getDisplayCurrencyExchangeRate()) : 0
        session['payFromAccount'] = false//accountValue > 0
        redirect(action: 'checkout')
    }

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
        basketItem.width = productModel?.width ?: productModel?.product?.width ?: 1
        basketItem.height = productModel?.height ?: productModel?.product?.height ?: 1
        basketItem.length = productModel?.product?.length ?: 1
        basketItem.weight = productModel?.weight ?: productModel?.product?.weight ?: 0

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


        def pts = []
        productModel?.product?.productTypes?.each { collectProductTypes(it, pts) }
        def addedValueTypes = pts?.collect {
            it.addedValueTypes
        }.flatten().unique().collect { [id: it.id, title: it.title, description: it.description] }
        basketItem.addedValueTypes = addedValueTypes


        def basketCounter = 0
        def basketPrice = 0
        basket.each {
            basketCounter += it.count
            basketPrice += (it.realPrice * it.count)
        }
        def bonDiscount = priceService.findDiscounts("Bon", basketPrice, basketCounter)

        session.setAttribute("bonDiscount", bonDiscount)
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
            if (session.mobile) {
                view = '/basket/checkoutMobile'
            }
            def currentStep = session['currentStep'] ?: 1

            def customInvoiceInformation = [:]
            customInvoiceInformation.ownerName = message(code: "customer.title.${customer ? customer.sex : session.checkout_customerInformation?.sex}") + ' ' +
                    (customer ? customer.toString() : session.checkout_customerInformation?.lastName)
            customInvoiceInformation.ownerCode = customer ? customer.nationalCode : session.checkout_customerInformation?.ownerCode
            customInvoiceInformation.ownerMobile = customer ? customer.mobile : session.checkout_customerInformation?.mobile

//            def deliveryMethods = DeliveryMethod.list().sort { it.name }
            def deliveryMethods = deliveryService.findAllDeliveryMethodsWithBasket(session.getAttribute("basket")).sort {
                it.name
            }
//            def addedValueTypes = AddedValueType.findAllBy.sort { it.title }
            def prevAddresses
            if (customer)
                prevAddresses = Order.findAllByCustomer(customer)?.collect { it.sendingAddress }?.findAll {
                    it.title?.trim()
                }?.groupBy {
                    it.title
                }?.collect { it.value.find() }
            session['currentStep'] = currentStep
            render(model: [
                    basket                  : session.getAttribute("basket"),
                    customer                : customer,
                    currentStep             : currentStep,
                    address                 : session.checkout_address,
                    customInvoiceInformation: customInvoiceInformation,
//                    addedValueTypes         : addedValueTypes,
                    prevAddresses           : prevAddresses,
                    deliveryMethods         : deliveryMethods
            ], view: view)
        } else {
            def customer = springSecurityService.currentUser as Customer
            if (!customer && !session.checkout_customerInformation && session.getAttribute("basket")?.size() > 0)
                session.forwardUri = createLink(controller: 'basket', action: 'checkout')
            else
                session.forwardUri = null

            def currentStep = 1

            if (customer || session.checkout_customerInformation) {
                if (session.mobile) {
                    currentStep = 1.5
                } else
                    currentStep = 2
            }

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
            if (session.mobile) {
                view = '/basket/checkoutMobile'

                if (params.currentStep) {
                    def cp = params.currentStep as Float
//                if(cp <= currentStep)
                    currentStep = cp
                }
            }

            if (!session.maxReachedStep || currentStep > session.maxReachedStep)
                session.maxReachedStep = currentStep

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
        def basketPrice = 0
        basket.each {
            basketCounter += it.count
            basketPrice += (it.realPrice * it.count)
        }
        def bonDiscount = priceService.findDiscounts("Bon", basketPrice, basketCounter)

        session.setAttribute("bonDiscount", bonDiscount)
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
        redirect(action: 'checkout', params: [currentStep: 1.5])
    }

    def checkoutAddress() {
        def model = [:]
        if (params.addressIsSameAsProfile?.toBoolean()) {
            model.address = (springSecurityService.currentUser as Customer).address
        }
        def view = 'checkout/address'
        if (session.mobile)
            view = 'checkout/mobile/address'
        render template: view, model: model
    }

    def storeShippingAddress() {
        def address = [:]
        address.city = City.get(params.city)
        address.postalCode = params.postalCode
        address.telephone = params.telephone
        address.addressLine1 = params.addressLine
        session.checkout_address = address
        redirect(action: 'checkout', params: [currentStep: 3])
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
        redirect(action: 'checkout', params: [currentStep: 4])
    }

    def shop() {

    }

    def alert() {

        def id = params.id
        def productModel = ProductModel.get(id)
        def template = 'alert'
        if (grailsApplication.config.customShoppingAlert)
            template = "/site/${grailsApplication.config.eShop.instance}/templates/alert" +
                    ""
        render template: template, model: [name: productModel?.product?.manualTitle ? productModel?.product?.pageTitle : ("${productModel?.product?.productTypes?.find()} ${productModel?.product?.type?.title ?: ''} ${productModel?.product?.brand} ${productModel?.variationValues?.find { it.variationGroup.representationType == 'Color' }?.value}")]
    }

    private void collectProductTypes(ProductType pt, res) {
        res.add(pt)
        if (pt.parentProduct)
            collectProductTypes(pt.parentProduct, res)
    }

    def addedValueSelect() {
        def addedValueType = AddedValueType.get(params.addedValueTypeId)
        def product = Product.get(params.productId)
        if (addedValueType && product) {
            def productTypes = []
            product.productTypes.each {
                collectProductTypes(it, productTypes)
            }
            def addedValues = AddedValue.createCriteria().list {
                eq('addedValueType', addedValueType)
                or {
                    'in'('baseProduct', productTypes)
                    isNull('baseProduct')
                }
            }
            render(template: "/site/${grailsApplication.config.eShop.instance}/templates/addedValuesForm",
                    model: [addedValues: addedValues, addedValueType: addedValueType, basketItemId: params.basketItemId])
        }
    }

    def removeAddedValue() {
        def basket = session.getAttribute("basket")
        if (!basket)
            basket = [];
        basket.each {
            if (it.id == params.id) {
                if (!it.selectedAddedValueInstances)
                    it.selectedAddedValueInstances = [:]
                def addedValueType = AddedValueType.get(params.typeId)
                it.selectedAddedValueInstances.remove(params.typeId)

                def price = priceService.calcProductModelPrice(it.id, it.selectedAddedValueInstances.collect {
                    it.value.id
                }, addedValueType?.defaultPrice ?: 0)
                it.price = price.showVal
                it.realPrice = price.showVal + price.addedVal

            }
        }
        session.setAttribute("basket", basket)
        render(basket as JSON)
    }

    def addedValueSelectSubmit() {
        def basket = session.getAttribute("basket")
        if (!basket)
            basket = [];
        basket.each {
            if (it.id == params.basketItemId) {
                if (!it.selectedAddedValueInstances)
                    it.selectedAddedValueInstances = [:]
                def addedValueType = AddedValueType.get(params.typeId)
                def addedValue = AddedValue.get(params.addedValueId)
                def customImage
                if (params.customImage) {
                    customImage = UUID.randomUUID().toString()
                    session[customImage] = params.customImage.bytes
                }


                it.selectedAddedValueInstances["${addedValueType?.id}"] = [
                        id         : params.addedValueId,
                        typeId     : params.typeId,
                        title      : addedValueType?.title,
                        subTitle   : addedValue?.name,
                        price      : addedValue?.value ?: addedValueType.defaultPrice,
                        description: params.description,
                        from       : params.from,
                        orderCount : params.int('count'),
                        image      : customImage]

                def price = priceService.calcProductModelPrice(it.id, it.selectedAddedValueInstances.collect {
                    it.value.id
                }, addedValueType?.defaultPrice ?: 0)
                it.price = price.showVal
                it.realPrice = price.showVal + price.addedVal

            }
        }
        session.setAttribute("basket", basket)
        render(basket as JSON)
//        def instance = new AddedValueInstance()
//        instance.addedValue = AddedValue.get(params.addedValueId)
//        instance.orderItem = OrderItem.get(params.basketItemId)
//        instance.from = params.from
//        if (instance.description)
//            instance.description = params.description
//        if (params.count)
//            instance.orderCount = params.int('count')
//        if (params.customImage)
//            instance.image = new Content(name: params.customImage.fileItem.fileName, contentType: 'image', fileContent: params.customImage.bytes).save()
//
//        if (instance.save()) {
//
//                    if (!it.selectedAddedValueInstances)
//                        it.selectedAddedValueInstances = []
//                    it.selectedAddedValueInstances << instance.id
//                    if (!it.selectedAddedValueInstanceNames)
//                        it.selectedAddedValueInstanceNames = []
//                    it.selectedAddedValueInstanceNames << instance.addedValue.addedValueType.title
//                }
//            }
//            session.setAttribute("basket", basket)
//            render 0
//        }


    }

    def updateDescriptionAndDelivery() {
        def basket = session.getAttribute("basket")
        if (!basket)
            basket = [];
        basket.each {
            it.description = params['description_' + it.id]
        }
        session.setAttribute('basket', basket)
        session.setAttribute('deliveryMethod', params.deliveryMethod)
        session.setAttribute('deliveryPrice', params.deliveryPrice)
        session['currentStep'] = 2
        def deliveryMethod = DeliveryMethod.get(params.deliveryMethod)
        render(deliveryMethod as JSON)
    }

    def updateBuyerAndPaymentTypeAndSendFactor() {
        session.setAttribute('paymentType', params.paymentType)
        session.setAttribute('buyerName', params.buyerName)
        session.setAttribute('sendFactor', params.sendFactor)
        session['currentStep'] = 3
        render 0
    }

    def updateDeliveryInfo() {
        session['callBeforeSend'] = params.callBeforeSend
        session['deliveryName'] = params.deliveryName
        session['deliveryPhone'] = params.deliveryPhone
        session['deliveryAddressLine'] = params.deliveryAddressLine
        session['deliveryCity'] = params.deliveryCity
        session['deliveryDate'] = params.deliveryDate
        session['deliveryDate_hour'] = params.deliveryDate_hour
        session['deliveryDate_minute'] = params.deliveryDate_minute
        def customer = springSecurityService.currentUser as Customer
        if (!customer)
            session['currentStep'] = 4
        render 0
    }

    def updateBuyerInfo() {
        session['buyerPhone'] = params.buyerPhone
        session['buyerEmail'] = params.buyerEmail
        render 0
    }

    def basketReview() {
        session['currentStep'] = 1
        render 0
    }

    def changeStep() {
        session['currentStep'] = params.int('id')
        render 0
    }

    def payFromAccount() {
        session['payFromAccount'] = params.payFromAccount
        render 0
    }

}
