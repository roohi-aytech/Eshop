package eshop

import grails.converters.JSON
import grails.plugins.springsecurity.Secured

@Secured(RoleHelper.ROLE_PRICE_ADMIN)
class PriceController {

    def mongoService
    def excelService

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def priceInstance
        def productModel

        if (params.id)
            priceInstance = Price.get(params.id)
        else
            priceInstance = new Price(params)

        if (params.productModel.id)
            productModel = ProductModel.get(params.productModel.id)

        render(template: "form", model: [priceInstance: priceInstance, productModel: productModel])
    }

    def list() {
    }

    def save() {
        def priceInstance
        params.price = params.price.toString().replace(',', '').toDouble()
        if (params.id) {
            priceInstance = Price.get(params.id)
//            priceInstance.properties = params
            priceInstance.productModel = ProductModel.get(params.productModel.id)
            priceInstance.price = params.price?.toDouble()
            if (params.currency)
                priceInstance.currency = Currency.get(params.currency)
        } else {
            priceInstance = new Price()
            priceInstance.productModel = ProductModel.get(params.productModel.id)
            priceInstance.price = params.price?.toDouble()
            if (params.currency)
                priceInstance.currency = Currency.get(params.currency)
            priceInstance.startDate = new Date()

            def lastPrice = Price.findByProductModelAndEndDateIsNull(priceInstance.productModel)

            if (lastPrice) {
                lastPrice.endDate = new Date()
                lastPrice.save()
            }
        }
        priceInstance.rialPrice = priceInstance.currency ? priceInstance.price * priceInstance.currency.exchangeRate : priceInstance.price

        if (priceInstance.validate() && priceInstance.save()) {
            priceInstance.productModel.product.isSynchronized = false
            priceInstance.productModel.product.save()
            render priceInstance as JSON
        } else
            render(template: "form", model: [priceInstance: priceInstance])
    }

    def delete() {
        def priceInstance = Price.get(params.id)
        def product = priceInstance.productModel.product
        priceInstance.delete(flush: true)
        product.isSynchronized = false
        product.save(flush: true)
        render 0
    }

    def bulkUpdate() {
        def model = [:]
        model.productTypesKey = UUID.randomUUID()
        session["bulkUpdate_productTypes_${model.productTypesKey}"] = ProductType.findAllByParentProductIsNullAndDeleted(false).collect {
            getProductTypesJson(it, [])
        }
        model.productTypeTypes = ProductTypeType.findAll().collect { [id: it.id, text: it.title] }
        model.brands = Brand.findAll().collect { [id: it.id, text: it.name] }
        model.guarantees = Guarantee.findAll().collect { [id: it.id, text: it.name] }
        model
    }

    def bulkUpdateForm() {

        def productTypeList = params.productTypes instanceof String ? [params.productTypes as Long] : params.productTypes.collect {
            it as Long
        } ?: []
        def productTypeTypeList = params.productTypeTypes instanceof String ? [params.productTypeTypes as Long] : params.productTypeTypes.collect {
            it as Long
        }
        def brandList = params.brands instanceof String ? [params.brands as Long] : params.brands.collect { it as Long }
        def guaranteeList = params.guarantees instanceof String ? [params.guarantees as Long] : params.guarantees.collect {
            it as Long
        }
        def statusList = params.statuses instanceof String ? [params.statuses as String] : params.statuses

        def model = [:]

//        model.productTypesKey = UUID.randomUUID()
//        session["bulkUpdate_productTypes_${model.productTypesKey}"] = ProductType.findAllByIdInList(ProductModel.createCriteria().listDistinct {
//            if (guaranteeList && guaranteeList.size() > 0) {
//                guarantee {
//                    'in'('id', guaranteeList)
//                }
//            }
//            if (statusList && statusList.size() > 0) {
//                'in'('status', statusList)
//            }
//            product {
//                or {
//                    eq('isVisible', true)
//                    isNull('isVisible')
//                }
//                or {
//                    eq('deleted', false)
//                    isNull('deleted')
//                }
//                if (brandList && brandList.size() > 0) {
//                    brand {
//                        'in'('id', brandList)
//                    }
//                }
//                if (productTypeTypeList && productTypeTypeList.size() > 0) {
//                    type {
//                        'in'('id', productTypeTypeList)
//                    }
//                }
//            }
//            projections {
//                product {
//                    productTypes {
//                        property('id')
//                    }
//                }
//            }
//        }).collect {
//            getProductTypesJson(it, productTypeList)
//        }
        model.selectedProductTypeTypes = productTypeTypeList
        model.productTypeTypes = ProductTypeType.findAllByIdInList(ProductModel.createCriteria().listDistinct {
            if (guaranteeList && guaranteeList.size() > 0) {
                guarantee {
                    'in'('id', guaranteeList)
                }
            }
            if (statusList && statusList.size() > 0) {
                'in'('status', statusList)
            }
            product {
                or {
                    eq('isVisible', true)
                    isNull('isVisible')
                }
                or {
                    eq('deleted', false)
                    isNull('deleted')
                }
                if (brandList && brandList.size() > 0) {
                    brand {
                        'in'('id', brandList)
                    }
                }

                if (productTypeList && productTypeList.size() > 0) {
                    productTypes {
                        'in'('id', productTypeList)
                    }
                }
            }
            projections {
                product {
                    type {
                        property('id')
                    }
                }
            }
        }).collect { [id: it.id, text: it.title] }
        model.selectedBrands = brandList
        model.brands = Brand.findAllByIdInList(ProductModel.createCriteria().listDistinct {
            if (guaranteeList && guaranteeList.size() > 0) {
                guarantee {
                    'in'('id', guaranteeList)
                }
            }
            if (statusList && statusList.size() > 0) {
                'in'('status', statusList)
            }
            product {
                or {
                    eq('isVisible', true)
                    isNull('isVisible')
                }
                or {
                    eq('deleted', false)
                    isNull('deleted')
                }
                if (productTypeTypeList && productTypeTypeList.size() > 0) {
                    type {
                        'in'('id', productTypeTypeList)
                    }
                }

                if (productTypeList && productTypeList.size() > 0) {
                    productTypes {
                        'in'('id', productTypeList)
                    }
                }
            }
            projections {
                product {
                    brand {
                        property('id')
                    }
                }
            }
        }).collect { [id: it.id, text: it.name] }
        model.selectedGuarantees = guaranteeList
        model.guarantees = Guarantee.findAllByIdInList(ProductModel.createCriteria().listDistinct {
            if (statusList && statusList.size() > 0) {
                'in'('status', statusList)
            }
            product {
                or {
                    eq('isVisible', true)
                    isNull('isVisible')
                }
                or {
                    eq('deleted', false)
                    isNull('deleted')
                }
                if (brandList && brandList.size() > 0) {
                    brand {
                        'in'('id', brandList)
                    }
                }
                if (productTypeTypeList && productTypeTypeList.size() > 0) {
                    type {
                        'in'('id', productTypeTypeList)
                    }
                }

                if (productTypeList && productTypeList.size() > 0) {
                    productTypes {
                        'in'('id', productTypeList)
                    }
                }
            }
            projections {
                guarantee {
                    property('id')
                }
            }
        }).collect { [id: it.id, text: it.name] }
        render template: 'bulkUpdateForm', model: model
    }

    def getProductTypesJson(ProductType parent, selectedIds) {
        def result = [:]
        result.id = parent.id
        result.text = parent.name
        result.checked = selectedIds.contains(result.id)
        def children = ProductType.findAllByParentProductAndDeleted(parent, false)
        if (children?.size() > 0) {
            result.children = []
            children.each {
                result.children.add(getProductTypesJson(it, selectedIds))
            }
        }
        result
    }

    def bulkUpdateProductTypesTree(){
        render session["bulkUpdate_productTypes_${params.id}"] as JSON
    }

    def exportPriceList() {
        excelService.exportPriceList(
                params.productTypes instanceof String ? [params.productTypes as Long] : params.productTypes.collect {
                    it as Long
                },
                params.productTypeTypes instanceof String ? [params.productTypeTypes as Long] : params.productTypeTypes.collect {
                    it as Long
                },
                params.brands instanceof String ? [params.brands as Long] : params.brands.collect { it as Long },
                params.guarantees instanceof String ? [params.guarantees as Long] : params.guarantees.collect {
                    it as Long
                },
                params.statuses instanceof String ? [params.statuses as String] : params.statuses,
                response)
    }

    def importPriceList() {
        def model = excelService.importPriceList(request.getFile('file').inputStream)

        model.productTypesKey = UUID.randomUUID()
        session["bulkUpdate_productTypes_${model.productTypesKey}"] = ProductType.findAllByParentProductIsNullAndDeleted(false).collect {
            getProductTypesJson(it, [])
        }
        model.productTypeTypes = ProductTypeType.findAll().collect { [id: it.id, text: it.title] }
        model.brands = Brand.findAll().collect { [id: it.id, text: it.name] }
        model.guarantees = Guarantee.findAll().collect { [id: it.id, text: it.name] }
        model.showResult = true
        render view: 'bulkUpdate', model: model
    }
}
