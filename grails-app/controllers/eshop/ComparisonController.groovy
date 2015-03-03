package eshop

import grails.converters.JSON
import org.apache.lucene.search.BooleanQuery
import search.FarsiNormalizationFilter

class ComparisonController {

    def priceService
    def browseService
    def searchableService

    def add() {
        def id = params.id
        def product = Product.get(id)

        def compareList = session.getAttribute("compareList")
        if (!compareList)
            compareList = [];
        def compareListItem = compareList.find { it -> it.id == id }
        if (!compareListItem) {
            compareListItem = [id: id, title: product?.toString(), type: product?.productTypes?.find()?.name, price: priceService.calcProductPrice(product.id).showVal]
            compareList << compareListItem
        }

        def compareListCounter = 0
        compareList.each { compareListCounter += 1 }

        session.setAttribute("compareListCounter", compareListCounter)
        session.setAttribute("compareList", compareList)
        render "1"
    }

    def addAndShow() {
        def id = params.id
        def product = Product.get(id)
        if (!product) {
            render ''
            return
        }

        def compareList = session.getAttribute("compareList")
        if (!compareList)
            compareList = [];
        def compareListItem = compareList.find { it -> it.id == id }
        if (!compareListItem) {
            compareListItem = [id: id, title: product.toString(), type: product?.productTypes?.find()?.name, price: priceService.calcProductPrice(product.id).showVal]
            compareList << compareListItem
        }

        def compareListCounter = 0
        compareList.each { compareListCounter += 1 }

        session.setAttribute("compareListCounter", compareListCounter)
        session.setAttribute("compareList", compareList)

        redirect(action: 'show')
    }

    def remove() {
        def id = params.id

        def compareList = session.getAttribute("compareList")
        if (!compareList)
            render "compareList is empty";
        compareList = compareList.findAll { it -> !(it.id == id) }

        def compareListCounter = 0
        compareList.each { compareListCounter += 1 }

        session.setAttribute("compareListCounter", compareListCounter)
        session.setAttribute("compareList", compareList)

        redirect(action: 'show')
    }

    def show() {

        if (params.productTypeId)
            session["selected-nodes-${params.productTypeId}"] = params.selectedNodes.split(',')

        def model = [productTypeList: []]

        def compareList = session.getAttribute("compareList")

        def productList = compareList.collect { Product.get(it.id) }

        productList.each { product ->
            def item = product.productTypes.toArray().first()
            if (!model.productTypeList.find { it.item.id == item.id })
                model.productTypeList.add([item: item, products: []])
            def type = model.productTypeList.find { it.item == item }
            type.products.add(product)
        }

        model.productTypeList.each { productType ->

            def selectedList = session["selected-nodes-${productType?.item?.id}"]

            productType.rootAttributeCategories = AttributeCategory.findAllByProductTypeAndParentCategoryIsNull(productType.item)
                    .toList().collect {
                [item: it, hasAttribute: false, selected: (!selectedList || selectedList.contains('c' + it.id.toString()))]
            }

            productType.rootAttributeCategories << [item: null, hasAttribute: false, selected: (!selectedList || selectedList.contains('c'))]

            productType.rootAttributeCategories.each {
                category ->
                    fillAttibuteCategoryChildren(productType.products, category, productType)
            }

            productType.brands = Product.createCriteria().list {
                productTypes {
                    eq('id', productType.item.id)
                }
                eq('isVisible', true)
                eq('deleted', false)
            }.collect { it.brand }.unique { it.id }.sort { it.name };
        }

        model
    }

    def fillAttibuteCategoryChildren(products, parentCategory, productType) {

        def selectedList = session["selected-nodes-${productType?.item?.id}"] as Collection

        if (parentCategory.item) {
            parentCategory.attributeTypes = AttributeType.findAllByCategoryAndDeleted(parentCategory.item, false).findAll {
                it.showPositions.contains('compare')
            }.
                    collect { [item: it, selected: (!selectedList || selectedList.contains(it.id.toString()))] }
            if (parentCategory.attributeTypes) {
                parentCategory.hasAttribute = parentCategory.attributeTypes.count { it } > 0
                parentCategory.selected = parentCategory.selected || parentCategory.attributeTypes.count {
                    (!selectedList || selectedList.contains(it.item.id.toString()))
                } > 0
            }

            parentCategory.attributeTypes.each { attributeType ->
                attributeType.values = []
                products.each { product ->
                    def attr = product.attributes.find { attribute ->
                        attribute.attributeType.id == attributeType.item.id
                    }

                    attributeType.values << attr?.value?.toString()
                }
            }

            parentCategory.childCategories = AttributeCategory.findAllByParentCategory(parentCategory.item).collect {
                [item: it, hasAttribute: false, selected: (!selectedList || selectedList.contains('c' + it.id.toString()))]
            }
            parentCategory.childCategories.each { childCategory ->
                fillAttibuteCategoryChildren(products, childCategory, productType)
                parentCategory.hasAttribute = parentCategory.hasAttribute || childCategory.hasAttribute
                parentCategory.selected = parentCategory.selected || childCategory.selected
            }
        } else {
            parentCategory.attributeTypes = []
            products.each { product ->
                product.attributes.each { attribute ->
                    if (!attribute.attributeType.deleted && attribute.attributeType.category == null && attribute.attributeType.showPositions.contains('compare')) {
                        def item = [item: attribute.attributeType, selected: (!selectedList || selectedList.contains(attribute.attributeType.id.toString()))]
                        if (!parentCategory.attributeTypes.contains(item)) {
                            parentCategory.attributeTypes << item
                        }
                    }
                }
            }
            if (parentCategory.attributeTypes) {
                parentCategory.hasAttribute = (parentCategory.attributeTypes.count { it } > 0)

                parentCategory.selected = (parentCategory.selected || parentCategory.attributeTypes.count {
                    (!selectedList || selectedList.contains(it.item.id.toString()))
                } > 0)
            }

            parentCategory.attributeTypes.each { attributeType ->
                attributeType.values = []
                products.each { product ->
                    def attr = product.attributes.find { attribute ->
                        attribute.attributeType.id == attributeType.item.id
                    }

                    attributeType.values << attr?.value?.toString()
                }
            }

            parentCategory.childCategories = [:]
        }
    }

    def productSelector() {

        if (!params.productTypeId) {
            render ''
            return
        }

        render(
                template: 'productSelector',
                model: [
                        products: Product.createCriteria().list {
                            productTypes {
                                eq('id', params.productTypeId.toLong())
                            }
                            eq('brand', Brand.get(params.brandId.toLong()))
                            eq('isVisible', true)
                            eq('deleted', false)
                        }.unique { it.id }.sort { it.name },
                        productTypeId: params.productTypeId.toLong()
                ]
        )
    }

    def searchAutoComplete() {

        def model = [:]
        def productIdList = []
        if (params.phrase) {
            def query = params.phrase.toString().trim()
            query = FarsiNormalizationFilter.normalize(query.toCharArray(), query.length())
            while (query.contains('  '))
                query = query.replace('  ', ' ')
            query = "*${query.replace(' ', '* *')}*"
            BooleanQuery.setMaxClauseCount(100000);
            productIdList = Product.search({
                queryString(query)
            },
                    [reload: false, max: 1000])
        }

        model.productIds = browseService.findSearchPageFilters(productIdList.results.collect {
            it.id
        }, params.f, params.page ?: 0, "${productIdList.results.collect { it.id }} ${params.f} ${params.page ?: 0}").products.productIds
        model.commonLink = createLink(uri: '/')
        model.productType = ProductType.get(params.id)

        if (model.productIds?.size() > 0)
            render(template: 'search_autoComplete', model: model)
        else
            render ''
    }

    def alert() {

        def id = params.id
        def product = Product.get(id)

        def map = [:]
        session["compareList"]?.each { item ->
            if (!map.containsKey(item.type))
                map.put(item.type, 0)
            map[item.type]++
        }


        render template: 'alert', model: [name: "${product?.productTypes?.find()} ${product?.type?.title ?: ''} ${product?.brand}", map: map, enabled: map.any {
            it.value > 1
        }]
    }
}
