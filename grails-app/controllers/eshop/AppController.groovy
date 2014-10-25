package eshop

import grails.converters.JSON
import org.apache.lucene.search.BooleanQuery
import search.FarsiNormalizationFilter

class AppController {
    def priceService
    def browseService

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
                [
                        id    : product.id,
                        title : "${product?.manualTitle ? product?.pageTitle : "${product?.productTypes?.find { true }?.name ?: ""} ${product?.type?.title ?: ""} ${product?.brand?.name ?: ""} ${product?.name ?: ""}"}",
                        price : formatNumber(number: priceService.calcProductPrice(product.id).showVal, type: 'number'),
//                    description: product.description,
                        models: product?.models?.findAll { it.status == 'exists' }?.sort { it.name }?.collect {
                            [
                                    id   : it.id,
                                    title: it.name,
                                    price: formatNumber(number: priceService.calcProductModelPrice(it.id).showVal, type: 'number')
                            ]
                        }
                ]
            }
        }
        render products.findAll() as JSON
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
                [title: 'سبد گل'],
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
                product.refresh()

                [
                        id    : product.id,
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
            } catch (x) {

            }
        }
        render products.findAll() as JSON
    }

}
