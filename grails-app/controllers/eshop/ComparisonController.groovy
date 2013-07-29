package eshop

import grails.converters.JSON

class ComparisonController {

    def priceService

    def add() {
        def id = params.id
        def product = Product.get(id)

        def compareList = session.getAttribute("compareList")
        if (!compareList)
            compareList = [];
        def compareListItem = compareList.find { it -> it.id == id }
        if (!compareListItem) {
            compareListItem = [id: id, title: product.toString(), price: priceService.calcProductPrice(product.id).showVal]
            compareList << compareListItem
        }

        def compareListCounter = 0
        compareList.each { compareListCounter += 1 }

        session.setAttribute("compareListCounter", compareListCounter)
        session.setAttribute("compareList", compareList)
        render "1"
    }

    def addAndShow(){
        def id = params.id
        def product = Product.get(id)

        def compareList = session.getAttribute("compareList")
        if (!compareList)
            compareList = [];
        def compareListItem = compareList.find { it -> it.id == id }
        if (!compareListItem) {
            compareListItem = [id: id, title: product.toString(), price: priceService.calcProductPrice(product.id).showVal]
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
                    .toList().collect { [item: it, hasAttribute: false, selected: (!selectedList || selectedList.contains('c' + it.id.toString()))] }

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
            parentCategory.attributeTypes = AttributeType.findAllByCategory(parentCategory.item).findAll { it.showPositions.contains('compare') }.
                    collect { [item: it, selected: (!selectedList || selectedList.contains(it.id.toString()))] }
            if (parentCategory.attributeTypes) {
                parentCategory.hasAttribute = parentCategory.attributeTypes.count { it } > 0
                parentCategory.selected = parentCategory.selected || parentCategory.attributeTypes.count { (!selectedList || selectedList.contains(it.item.id.toString())) } > 0
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

            parentCategory.childCategories = AttributeCategory.findAllByParentCategory(parentCategory.item).collect { [item: it, hasAttribute: false, selected: (!selectedList || selectedList.contains('c' + it.id.toString()))] }
            parentCategory.childCategories.each { childCategory ->
                fillAttibuteCategoryChildren(products, childCategory, productType)
                parentCategory.hasAttribute = parentCategory.hasAttribute || childCategory.hasAttribute
                parentCategory.selected = parentCategory.selected || childCategory.selected
            }
        } else {
            parentCategory.attributeTypes = []
            products.each { product ->
                product.attributes.each { attribute ->
                    if (attribute.attributeType.category == null && attribute.attributeType.showPositions.contains('compare')) {
                        def item = [item: attribute.attributeType, selected: (!selectedList || selectedList.contains(attribute.attributeType.id.toString()))]
                        if (!parentCategory.attributeTypes.contains(item)) {
                            parentCategory.attributeTypes << item
                        }
                    }
                }
            }
            if (parentCategory.attributeTypes) {
                parentCategory.hasAttribute = (parentCategory.attributeTypes.count { it } > 0)

                parentCategory.selected = (parentCategory.selected || parentCategory.attributeTypes.count { (!selectedList || selectedList.contains(it.item.id.toString())) } > 0)
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
}
