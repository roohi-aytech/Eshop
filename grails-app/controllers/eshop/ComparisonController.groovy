package eshop

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
            compareListItem = [id: id, title: product.toString(), price: priceService.calcProductPrice(product.id).mainVal]
            compareList << compareListItem
        }

        def compareListCounter = 0
        compareList.each { compareListCounter += 1 }

        session.setAttribute("compareListCounter", compareListCounter)
        session.setAttribute("compareList", compareList)
        render "1"
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

            productType.rootAttributeCategories = AttributeCategory.findAllByProductTypeAndParentCategoryIsNull(productType.item)
                    .toList().collect { [item: it] }

            productType.rootAttributeCategories.each {
                category ->
                    fillAttibuteCategoryChildren(productType.products, category)
            }
        }

        model
    }

    def fillAttibuteCategoryChildren(products, parentCategory) {

        parentCategory.attributeTypes = AttributeType.findAllByCategory(parentCategory.item).collect { [item: it] }

        parentCategory.attributeTypes.each { attributeType ->
            attributeType.values = []
            products.each { product ->
                def attr = product.attributes.find { attribute ->
                    attribute.attributeType.id == attributeType.item.id
                }

                attributeType.values << attr?.value?.toString()
            }
        }

        parentCategory.childCategories = AttributeCategory.findAllByParentCategory(parentCategory.item).collect { [item: it] }
        parentCategory.childCategories.each { childCategory ->
            fillAttibuteCategoryChildren(products, childCategory)
        }
    }
}
