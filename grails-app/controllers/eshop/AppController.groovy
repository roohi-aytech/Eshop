package eshop

import eshop.accounting.Account
import eshop.accounting.OnlinePayment
import eshop.delivery.DeliveryMethod
import fi.joensuu.joyds1.calendar.JalaliCalendar
import grails.converters.JSON
import org.apache.lucene.search.BooleanQuery
import search.FarsiNormalizationFilter

class AppController {
    def priceService
    def browseService
    def springSecurityService
    def mailService
    def messageService
    def deliveryService
    def accountingService

    def mostVisited() {
        def match = [:]
        def productType
        if (params.p)
            productType = ProductType.createCriteria().list {
                or {
                    eq('pageTitle', params.p)
                    eq('name', params.p)
                    eq('seoFriendlyName', params.p)
                }
                or {
                    eq('deleted', false)
                    isNull('deleted')
                }
            }.find()
        if (productType)
            match['productTypes.id'] = productType.id
        if (params.p) {
            def prices = params.p.split('-')
            def ps = [:]
            if (prices[0]?.toString()?.isNumber())
                ps['$gte'] = prices[0] as int
            if (prices.size() > 1 && prices[1]?.toString()?.isNumber())
                ps['$lte'] = prices[1] as int
            if (ps)
                match['price'] = ps
        }
        int offset = params.int('offset') ?: 0
//        def products = ProductModel.createCriteria().list(max:20,offset: offset){
//            projections {
//                distinct('product')
//            }
//
//            eq('status', 'exists')
//            product {
//                or {
//                    isNull('isVisible')
//                    eq('isVisible', true)
//                }
//                if (productType) {
//                    productTypes {
//                        'in'('id', productType?.allChildren?.collect { it.id } + [productType.id])
//                    }
//                }
//                order("visitCount", "desc")
//            }
        def products = browseService.listProducts(sort: 'visitCount', dir: -1, match: match, pageSize: 20, start: offset)
                .productIds.collect { pt ->
            def product = ProductModel.get(pt.modelId)?.product
            if (product) {
                productCollector(product)
            }
        }
        render products.findAll() as JSON
    }

    def get() {
        def product = Product.get(params.id)
        def p
        if (product)
            p = productCollector(product)
        render p as JSON
    }

    def productTypes() {
        def pts = [
                [title: 'همه'],
                [title: '<100', value: '-100000'],
                [title: 'سبد گل'],
                [title: 'تولد'],
                [title: 'تسلیت'],
                [title: 'گلدان'],
                [title: '100 - 200', value: '100000-200000'],
                [title: 'کیک'],
                [title: 'شکلات و گل'],
                [title: 'روز عشاق'],
                [title: 'گل کاغذی'],
                [title: '>200', value: '200000-'],
                [title: 'دسر'],
                [title: 'بن سای'],
                [title: 'باکس گل']
        ]
        render pts as JSON
    }

    def search() {
        def query = params.id.toString().trim()
        query = FarsiNormalizationFilter.normalize(query.toCharArray(), query.length())
        while (query.contains('  '))
            query = query.replace('  ', ' ')
        query = "*${query.replace(' ', '* *')}*"
        BooleanQuery.setMaxClauseCount(10000);
        def products = Product.search({
            queryString(query)
        }, [reload: false, max: 1000]).results.collect { product ->
            try {
                if (product) {
                    product.refresh()
                    productCollector(product)
                }
            } catch (x) {

            }
        }
        render products.findAll() as JSON
    }

    def banners() {
        def bns = Banner.findAllByDeleted(false).collect {
            [
                    id: it.id
            ]
        }
        render bns as JSON
    }
    private def productCollector = { product ->
        [
                id    : product.id,
                brand : product?.brand?.name,
                title : "${product?.manualTitle ? product?.pageTitle : "${product?.productTypes?.find { true }?.name ?: ""} ${product?.type?.title ?: ""} ${product?.brand?.name ?: ""} ${product?.name ?: ""}"}",
                price : formatNumber(number: priceService.calcProductPrice(product.id).showVal, type: 'number'),
                models: product?.models?.findAll { it.status == 'exists' }?.sort { it.name }?.collect {
                    [
                            id       : it.id,
                            title    : it.name,
                            isDefault: it.isDefaultModel,
                            price    : formatNumber(number: priceService.calcProductModelPrice(it.id).showVal, type: 'number')
                    ]
                }
        ]
    }

    def login() {
        def params = request.JSON
        if (params.code) {
            def user = User.findByUsername(params.username)
            if (user) {
                if (user.password == springSecurityService.encodePassword(params.password)) {
                    def device = MobileDevice.findByDeviceCode(params.code) ?: new MobileDevice(deviceCode: params.code)
                    if (device.user?.username == params.username) {
                        return render([res: true] as JSON)
                    }
                    device.user = user
                    device.save()
                    return render([res: true] as JSON)
                }
            }
        }
        return render([res: false] as JSON)
    }

    def logout() {
        def params = request.JSON
        if (params.code) {
            def device = MobileDevice.findByDeviceCode(params.code)
            device?.delete()
            return render([res: true] as JSON)
        }
        return render([res: false] as JSON)
    }

    def activate() {
        def params = request.JSON
        if (params.code) {
            def device = MobileDevice.findByDeviceCode(params.code)
            if (device?.user?.id?.encodeAsSHA256()?.substring(0, 6).equalsIgnoreCase(params.acode)) {
                device?.user?.enabled = true
                device?.user?.save()
                return render([res: true] as JSON)
            }
        }
        render([res: false] as JSON)
    }

    def register() {
        def params = request.JSON
        if (params.code) {
            def customerInstance = new Customer()

            customerInstance.firstName = params.firstName
            customerInstance.lastName = params.lastName
            customerInstance.sex = params.sex
            customerInstance.username = params.username
            customerInstance.password = params.password
            customerInstance.email = params.username
            customerInstance.mobile = params.mobile
            customerInstance.registrationLevel = 'basic'
            customerInstance.enabled = false

            if (customerInstance.validate() && customerInstance.save()) {
                def customerRole = Role.findByAuthority(RoleHelper.ROLE_CUSTOMER)
                UserRole.create customerInstance, customerRole
                def device = MobileDevice.findByDeviceCode(params.code) ?: new MobileDevice(deviceCode: params.code)
                device.user = customerInstance
                device.save()


                if (customerInstance.mobile) {
                    def code = customerInstance.id.encodeAsSHA256().substring(0, 6).toUpperCase()

                    messageService.sendMessage(
                            customerInstance.mobile,
                            g.render(template: '/messageTemplates/sms/mobile_verification', model: [customer: customerInstance, code: code]).toString())
                }
                mailService.sendMail {
                    to customerInstance.email
                    subject message(code: 'emailTemplates.email_verification.subject')
                    html(view: "/messageTemplates/${grailsApplication.config.eShop.instance}_email_template",
                            model: [message: g.render(template: '/messageTemplates/mail/email_verification', model: [customer: customerInstance]).toString()])
                }

                render([res: true] as JSON)
            } else {
                render([res: false] as JSON)
            }

        } else {
            render([res: false] as JSON)
        }
    }

    def resendActivation() {
        def params = request.JSON
        if (params.code) {
            def device = MobileDevice.findByDeviceCode(params.code)
            if (device) {
                if (device.user.mobile) {
                    def code = device.user.id.encodeAsSHA256().substring(0, 6).toUpperCase()

                    messageService.sendMessage(
                            device.user.mobile,
                            g.render(template: '/messageTemplates/sms/mobile_verification', model: [customer: device.user, code: code]).toString())
                }
                mailService.sendMail {
                    to device.user.email
                    subject message(code: 'emailTemplates.email_verification.subject')
                    html(view: "/messageTemplates/${grailsApplication.config.eShop.instance}_email_template",
                            model: [message: g.render(template: '/messageTemplates/mail/email_verification', model: [customer: device.user]).toString()])
                }
                return render([res: true] as JSON)
            }
        }
        return render([res: false] as JSON)
    }

    def personalInfo() {
        def params = request.JSON
        if (params.code) {
            def device = MobileDevice.findByDeviceCode(params.code)
            if (device) {
                def customer = device.user
                def bd
                if (customer.birthDate) {
                    def c = Calendar.instance
                    c.time = customer.birthDate
                    def jc = new JalaliCalendar(c)
                    bd = "${jc.year}/${jc.month}/${jc.day}"
                }
                return render([
                        firstName   : customer.firstName ?: '',
                        lastName    : customer.lastName ?: '',
                        sex         : customer.sex ?: '',
                        mobile      : customer.mobile ?: '',
                        birthDate   : bd ?: '',
                        addressLine1: customer.address?.addressLine1 ?: '',
                        melliCode   : customer.nationalCode ?: '',
                        res         : true
                ] as JSON)
            }
        }
        return render([res: false] as JSON)
    }

    def savePersonalInfo() {
        def params = request.JSON
        if (params.code) {
            def device = MobileDevice.findByDeviceCode(params.code)
            if (device) {
                def customer = device.user
                customer.properties = params
                try {
                    def jc = new JalaliCalendar(params.birthDate.split('/')[0] as int, params.birthDate.split('/')[1] as int, params.birthDate.split('/')[2] as int)
                    customer.birthDate = jc.toJavaUtilGregorianCalendar().time
                } catch (x) {
                    return render([res: false] as JSON)
                }
                customer.profilePersonalInfoFilled = true
                customer.registrationLevel = 'profile'
                customer.save()

                Address address = customer.address
                if (!address)
                    address = new Address()
                address.addressLine1 = params.addressLine1
                address.postalCode = params.postalCode
                address.telephone = params.telephone
                address.city = City.get(params.city)

                if (address.validate() && address.save()) {
                    customer.address = address
                    customer.save()
                }
                return render([res: true] as JSON)
            }
        }
        return render([res: false] as JSON)
    }

    def personalEvents() {
        def params = request.JSON
        if (params.code) {
            def device = MobileDevice.findByDeviceCode(params.code)
            if (device) {
                def customer = device.user
                def events = customer.personalEvents.collect {
                    def month
                    def date
                    if (customer.birthDate) {
                        def c = Calendar.instance
                        c.time = it.date
                        def jc = new JalaliCalendar(c)
                        month = jc.month
                        date = jc.day
                    }
                    [
                            id            : it.id,
                            title         : it.title,
                            fullName      : it.fullName,
                            month         : month,
                            date          : date,
                            sex           : it.sex,
                            relationshipId: it.relationship?.id,
                            relationship  : it.relationship?.title,
                            email         : it.emailNotification,
                            sms           : it.smsNotification


                    ]
                }
                return render(events as JSON)
            }
        }
        return render([res: false] as JSON)
    }

    def savePersonalEvent() {
        def params = request.JSON
        if (params.code) {
            def device = MobileDevice.findByDeviceCode(params.code)
            if (device) {
                def customer = device.user
                def personalEvent = PersonalEvent.get(params.id) ?: new PersonalEvent()
                personalEvent.customer = customer
                personalEvent.emailNotification = params.email
                personalEvent.smsNotification = params.sms
                def jc = new JalaliCalendar()
                jc.set(jc.year, (params.month as int), params.date as int)
                def cal = jc.toJavaUtilGregorianCalendar()
                if (cal.time.before(new Date()))
                    cal.add(Calendar.YEAR, 1)
                personalEvent.date = cal.time
                personalEvent.fullName = params.fullName
                personalEvent.relationship = Relationship.get(params.relationshipId)
                personalEvent.sex = params.sex
                personalEvent.title = params.title
                if (personalEvent.save())
                    return render([res: true] as JSON)
            }
        }
        return render([res: false] as JSON)
    }

    def deletePersonalEvent() {
        def params = request.JSON
        if (params.code) {
            def device = MobileDevice.findByDeviceCode(params.code)
            if (device) {
                def customer = device.user
                def pe = PersonalEvent.findByCustomerAndId(customer, params.id)
                if (pe) {
                    pe.delete()
                    return render([res: true] as JSON)
                }
            }
        }
        return render([res: false] as JSON)
    }

    def relationships() {
        render(Relationship.findAllByDeleted(false).sort { it.id }.collect { [id: it.id, title: it.title] } as JSON)
    }

    def events() {
        if (grailsApplication.config.profilePersonalEventDefaultProductType)
            render(ProductType.findByName(grailsApplication.config.profilePersonalEventDefaultProductType)
                    .children
                    .findAll { !it.deleted }
                    .sort { it.id }
                    .collect { [id: it.id, title: it.name] } as JSON)
        else
            render(CultureEvent.list().sort { it.id }.collect { [id: it.id, title: it.title] } as JSON)

    }

    def feedback() {
        def params = request.JSON
        if (params.code) {
            def user = MobileDevice.findByDeviceCode(params.code)?.user
            mailService.sendMail {
                to params.department
                subject "${message(code: 'contactUs.email.subject')}"
                html(view: "/messageTemplates/mail/contactus",
                        model: [
                                firstName: user?.firstName ?: params.firstName,
                                lastName : user?.lastName ?: params.lastName,
                                email    : user?.email ?: params.email,
                                phone    : user?.mobile ?: params.phone,
                                body     : params.body
                        ])
                mailService.sendMail {
                    to user?.email ?: params.email
                    subject message(code: 'emailTemplates.contact_us.subject')
                    html(view: "/messageTemplates/${grailsApplication.config.eShop.instance}_email_template",
                            model: [message: g.render(template: '/messageTemplates/mail/contact_us', model: [parameters: params]).toString()])
                }

                if (user?.mobile ?: params.phone)
                    messageService.sendMessage(
                            user?.mobile ?: params.phone,
                            g.render(template: '/messageTemplates/sms/contact_us', model: [parameters: params]).toString())


            }
        }
        render([res: true] as JSON)
    }

    def basketPreInfo() {
        def params = request.JSON
        if (params.code) {
            def device = MobileDevice.findByDeviceCode(params.code)
            if (device) {
                def customer = device.user

                def model = ProductModel.get(params.modelId)
                if (model) {
                    def prevAddresses = Order.findAllByCustomer(customer)?.collect { it.sendingAddress }?.findAll {
                        it.title?.trim()
                    }?.groupBy {
                        it.title
                    }?.collect {
                        def address = it.value.find()
                        return [name: address.title, phone: address.telephone, address: address.addressLine1]
                    }
                    def price = priceService.calcProductModelPrice(model.id).showVal
                    def items = [[
                                         count : 1,
                                         weight: model?.weight ?: model?.product?.weight ?: 1,
                                         width : model?.width ?: model?.product?.width ?: 1,
                                         height: model?.height ?: model?.product?.height ?: 1,
                                         length: model?.product?.length ?: 1,
                                         price : price
                                 ]]
                    def deliveries = deliveryService.findAllDeliveryMethodsWithBasket(items).collect {
                        [id: it.id, name: it.name, description: it.description, price: formatNumber(number: it.price, type: 'number')]
                    }
                    def accountValue = customer ? accountingService.calculateCustomerAccountValue(customer) : 0
                    return render([addresses: prevAddresses, deliveryMethods: deliveries, bon: formatNumber(number: accountValue, type: 'number'), res: true] as JSON)
                }
            }
        }
        return render([res: false] as JSON)
    }

    def finalizeOrder() {
        def params = request.JSON
        if (params.code) {
            def device = MobileDevice.findByDeviceCode(params.code)
            if (device) {
                def customer = device.user
                Order order = new Order()
                order.ownerName = "${customer.firstName} ${customer.lastName}"
                order.ownerEmail = customer.email
                order.ownerMobile = customer.mobile
                order.ownerTelephone = customer.telephone
                order.customer = customer
                Address address = new Address()
                address.addressLine1 = params.address.address
                address.telephone = params.address.phone
                address.title = params.address.name
                if (!address.save())
                    println(address.errors.allErrors)


                order.sendingAddress = address
                order.billingAddress = address
                order.paymentType = params.paymentType
                order.sendFactorWith = Boolean.parseBoolean(params.sendFactor?.toString() ?: 'false')

                def model = ProductModel.get(params.modelId)
                def price = priceService.calcProductModelPrice(model.id).showVal
                def items = [[
                                     count : 1,
                                     weight: model?.weight ?: model?.product?.weight ?: 1,
                                     width : model?.width ?: model?.product?.width ?: 1,
                                     height: model?.height ?: model?.product?.height ?: 1,
                                     length: model?.product?.length ?: 1,
                                     price : price
                             ]]
                def deliveryMethod = DeliveryMethod.get(params.deliveryMethodId)
                order.deliveryPrice = deliveryService.calculateDeliveryMethodPriceWithBasket(items, deliveryMethod).price
                order.callBeforeSend = params.callBefore
                order.deliverySourceStation = eshop.delivery.DeliveryMethod.get(params.deliveryMethodId)?.sourceStations?.find()
                order.deliveryTime = "${params.deliveryTime.hour}:${params.deliveryTime.minute} ${params.deliveryTime.month}/${params.deliveryTime.day}"
                order.status = OrderHelper.STATUS_CREATED
                order.save()
                println order.errors.allErrors
                def cal = Calendar.getInstance()
                cal.setTime(new Date())
                def jc = new JalaliCalendar(cal)
                order.trackingCode = String.format(
                        "%02d%02d%02d%01d%03d",
                        jc.getYear() % 100,
                        jc.getMonth(),
                        jc.getDay(),
                        0, //customer type flag
                        order.id % 1000
                )

                def orderItem = new OrderItem()
                orderItem.productModel = model
                orderItem.order = order
                orderItem.description = ''
                orderItem.orderCount = 1
                orderItem.unitPrice = price
                orderItem.save()
                if (params.useGolbon && customer) {
                    def acctValue = accountingService.calculateCustomerAccountValue(customer)
                    order.usedAccountValue = acctValue
                }
                priceService.updateOrderPrice(order);

                def trackingLog = new OrderTrackingLog()
                trackingLog.action = OrderHelper.ACTION_CREATION
                trackingLog.date = new Date()
                trackingLog.order = order
                trackingLog.user = springSecurityService.currentUser as User
                trackingLog.title = "order.actions.${OrderHelper.ACTION_CREATION}"
                if (!trackingLog.validate() || !trackingLog.save()) {
                    return render([res: true] as JSON)
                }
                event(topic: 'order_event', data: [id: order.id, status: OrderHelper.STATUS_CREATED], namespace: 'browser')
                mailService.sendMail {
                    to order.ownerEmail
                    subject message(code: 'emailTemplates.order_created.subject')
                    html(view: "/messageTemplates/${grailsApplication.config.eShop.instance}_email_template",
                            model: [message: g.render(template: '/messageTemplates/mail/order_created', model: [order: order]).toString()])
                }
                def messageText = g.render(template: '/messageTemplates/sms/order_created', model: [order: order]).toString()
                def mobile = order.ownerMobile
                Thread.start {
                    messageService.sendMessage(
                            mobile,
                            messageText)
                }
                if (grailsApplication.config.orderCreateNotifiers) {
                    def adminText = g.render(template: '/messageTemplates/sms/orderCreatedAdminNotify', model: [order: order]).toString()
                    def adminNotifiers = grailsApplication.config.orderCreateNotifiers
                    Thread.start {
                        adminNotifiers.split(',').each {
                            messageService.sendMessage(
                                    it,
                                    adminText)
                        }
                    }
                }
                def res = [res: true, trackingCode: order.trackingCode]
                if (order.paymentType == 'online') {
                    Account account = Account.findAllByBankNameAndHasOnlinePayment('saman', true).find();


                    def onlinePayment = new OnlinePayment()
                    onlinePayment.account = account
                    onlinePayment.amount = order.totalPayablePrice * priceService.getDisplayCurrencyExchangeRate()
                    onlinePayment.customer = order.customer
                    onlinePayment.date = new Date()
                    onlinePayment.order = order
                    onlinePayment.usingCustomerAccountValueAllowed = params.useGolbon ?: order.customer ? true : false
                    onlinePayment.save()

                    res.amount = onlinePayment.amount
                    res.reservationNumber = onlinePayment.id
                    def onlinePaymentConfiguration = new XmlParser().parseText(onlinePayment.account.onlinePaymentConfiguration)
                    res.merchantId = onlinePaymentConfiguration.userName.text()

                }
                return render(res as JSON)
            }
        }
        return render([res: false] as JSON)
    }

}
