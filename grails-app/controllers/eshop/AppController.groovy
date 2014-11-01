package eshop

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
                def device = MobileDevice.findByDeviceCode(params.code) ?: new MobileDevice(deviceCode: params.code, user: user)
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

}
