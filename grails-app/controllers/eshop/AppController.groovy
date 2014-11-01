package eshop

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
                            id   : it.id,
                            title: it.name,
                            price: formatNumber(number: priceService.calcProductModelPrice(it.id).showVal, type: 'number')
                    ]
                }
        ]
    }

    def login() {
        def params = request.JSON

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
        return render([res: false] as JSON)
    }

    def logout() {
        def params = request.JSON
        def device = MobileDevice.findByDeviceCode(params.code)
        device?.delete()
        render([res: true] as JSON)
    }

    def activate() {
        def params = request.JSON
        def device = MobileDevice.findByDeviceCode(params.code)
        if (device?.user?.id?.encodeAsSHA256()?.substring(0, 6).equalsIgnoreCase(params.acode)) {
            device?.user?.enabled = true
            device?.user?.save()
            return render([res: true] as JSON)
        }
        render([res: false] as JSON)
    }

    def register() {
        def params = request.JSON
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
    }

    def resendActivation() {
        def params = request.JSON
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
        return render([res: false] as JSON)
    }

    def personalInfo() {
        def params = request.JSON
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
        return render([res: false] as JSON)
    }

    def savePersonalInfo() {
        def params = request.JSON
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
        return render([res: false] as JSON)
    }

    def personalEvents() {
        def params = request.JSON
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
        return render([res: false] as JSON)
    }

    def savePersonalEvent() {
        def params = request.JSON
        def device = MobileDevice.findByDeviceCode(params.code)
        if (device) {
            def customer = device.user
            def personalEvent = PersonalEvent.get(params.id) ?: new PersonalEvent()
            personalEvent.customer = customer
            personalEvent.emailNotification = params.email
            personalEvent.smsNotification = params.sms
            def jc = new JalaliCalendar()
            jc.set(jc.year, (params.month as int) , params.date as int)
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
        return render([res: false] as JSON)
    }

    def deletePersonalEvent() {
        def params = request.JSON
        def device = MobileDevice.findByDeviceCode(params.code)
        if (device) {
            def customer = device.user
            def pe = PersonalEvent.findByCustomerAndId(customer, params.id)
            if (pe) {
                pe.delete()
                return render([res: true] as JSON)
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

}
