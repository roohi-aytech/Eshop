package eshop

import grails.converters.JSON

class AppController {
    def priceService

    def mostVisited() {
        def productType = ProductType.get(params.ptId)
        int offset = params.int('offset') ?: 0
        def products = ProductModel.createCriteria().list(max:20,offset: offset){
            projections {
                distinct('product')
            }

            eq('status', 'exists')
            product {
                or {
                    isNull('isVisible')
                    eq('isVisible', true)
                }
                if (productType) {
                    productTypes {
                        'in'('id', productType?.allChildren?.collect { it.id } + [productType.id])
                    }
                }
                order("visitCount", "desc")
            }
        }.collect { Product product ->
            [
                    id    : product.id,
                    title : "${product?.manualTitle ? product?.pageTitle : "${product?.productTypes?.find { true }?.name ?: ""} ${product?.type?.title ?: ""} ${product?.brand?.name ?: ""} ${product?.name ?: ""}"}",
                    price : formatNumber(number: priceService.calcProductPrice(product.id).showVal, type: 'number'),
//                    description: product.description,
                    models: product?.models?.findAll { it.status == 'exists' }.sort { it.name }.collect {
                        [
                                id   : it.id,
                                title: it.name,
                                price:formatNumber(number: priceService.calcProductModelPrice(it.id).showVal, type: 'number')
                        ]
                    }
            ]
        }
        render products as JSON
    }

    def productTypes() {
        def pts = ProductType.findAllByDeleted(false).collect {
            [
                    id   : it.id,
                    title: it.name
            ]
        }
        render pts as JSON
    }

}
