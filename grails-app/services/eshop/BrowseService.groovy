package eshop

import grails.plugin.cache.Cacheable
import org.springframework.web.context.request.RequestContextHolder

class BrowseService {
    def mongo
    def db
    def products
    def searchableService
    def grailsApplication

    def getProducts() {
        if (!products) {
            db = mongo.getDB("EShop")
            products = db.getCollection("mongoProduct")
        }
        return products
    }

    def countProducts(params) {
        def products = getProducts()
        params.match["displayInList"] = true
        def countMap = products.aggregate(
                [$match: params.match],
                [$group: [_id: params.group, count: [$sum: 1]]],
                [$match: [count: [$gt: 0], _id: [$ne: null]]],
                [$match: [_id: [$ne: 'N/A']]],
                [$sort: [count: -1]]
        ).results()
        countMap
    }

    def countProductsWithUnwind(params) {
        def products = getProducts()
        params.match["displayInList"] = true
        def countMap = products.aggregate(
                [$match: params.match],
                [$unwind: params.unwind],
                [$group: [_id: params.group, count: [$sum: 1]]],
                [$match: [count: [$gt: 0], _id: [$ne: null]]],
                [$sort: [count: -1]]
        ).results()
        countMap
    }

    def pagesCount(match, pageSize) {

        (products.aggregate(
                [$match: match],
                [$group: [_id: null, count: [$sum: 1]]]
        ).results().collect { it.count }.find() ?: 0) / pageSize
    }

    def listRandomProducts(params) {

        def products = getProducts()
        params.match["displayInList"] = true

        def totalPages = pagesCount(params.match, params.pageSize)

        if (params.resetPagesCountMap) {

            def pageCountByStatus = [:]

            //exists
            def customizedMatch = params.match.clone()
            customizedMatch.status = 0
            pageCountByStatus['exists'] = pagesCount(customizedMatch, params.pageSize)

            //inquiry-required
            customizedMatch = params.match.clone()
            customizedMatch.status = 1
            pageCountByStatus['inquiry-required'] = pagesCount(customizedMatch, params.pageSize)

            //coming-soon
            customizedMatch = params.match.clone()
            customizedMatch.status = 2
            pageCountByStatus['coming-soon'] = pagesCount(customizedMatch, params.pageSize)

            //not-exists
            customizedMatch = params.match.clone()
            customizedMatch.status = 3
            pageCountByStatus['not-exists'] = pagesCount(customizedMatch, params.pageSize)

            def splitPoints = [
                    1,
                    Math.floor(pageCountByStatus['exists']).toInteger(),
                    Math.ceil(pageCountByStatus['exists']).toInteger(),
                    (Math.floor(pageCountByStatus['exists'] + pageCountByStatus['inquiry-required'])).toInteger(),
                    (Math.ceil(pageCountByStatus['exists'] + pageCountByStatus['inquiry-required'])).toInteger(),
                    (Math.floor(pageCountByStatus['exists'] + pageCountByStatus['inquiry-required'] + pageCountByStatus['coming-soon'])).toInteger(),
                    (Math.ceil(pageCountByStatus['exists'] + pageCountByStatus['inquiry-required'] + pageCountByStatus['coming-soon'])).toInteger(),
                    Math.ceil(totalPages).toInteger()
            ]

            for (def i = 1; i < splitPoints.size(); i++)
                if (splitPoints[i] < splitPoints[i - 1])
                    splitPoints[i] = splitPoints[i - 1]

            def tempPagesCountMap = []
            for (def i = 0; i < totalPages; i++)
                tempPagesCountMap[i] = i + 1

            def pagesCountMap = []
            if (!pagesCountMap.contains(splitPoints[0]))
                pagesCountMap.add(splitPoints[0])
            if (splitPoints[1] > splitPoints[0])
                pagesCountMap.addAll(shuffleArray(tempPagesCountMap, splitPoints[0], splitPoints[1]))
            if (!pagesCountMap.contains(splitPoints[1]))
                pagesCountMap.add(splitPoints[1])

            if (!pagesCountMap.contains(splitPoints[0]))
                pagesCountMap.add(splitPoints[2])
            if (splitPoints[3] > splitPoints[2])
                pagesCountMap.addAll(shuffleArray(tempPagesCountMap, splitPoints[2], splitPoints[3]))
            if (!pagesCountMap.contains(splitPoints[3]))
                pagesCountMap.add(splitPoints[3])

            if (!pagesCountMap.contains(splitPoints[0]))
                pagesCountMap.add(splitPoints[4])
            if (splitPoints[5] > splitPoints[4])
                pagesCountMap.addAll(shuffleArray(tempPagesCountMap, splitPoints[4], splitPoints[5]))
            if (!pagesCountMap.contains(splitPoints[5]))
                pagesCountMap.add(splitPoints[5])

            if (!pagesCountMap.contains(splitPoints[0]))
                pagesCountMap.add(splitPoints[6])
            if (splitPoints[7] > splitPoints[6])
                pagesCountMap.addAll(shuffleArray(tempPagesCountMap, splitPoints[6], splitPoints[7]))
            if (!pagesCountMap.contains(splitPoints[7]))
                pagesCountMap.add(splitPoints[7])

//            for (def i = 0; i < pagesCountMap.count { it }; i++)
//                pagesCountMap[i]--

            if (pagesCountMap.indexOf(0) != -1)
                pagesCountMap.remove(pagesCountMap.indexOf(0))

            if (pagesCountMap.indexOf(0D) != -1)
                pagesCountMap.remove(pagesCountMap.indexOf(0D))

            def indexOfLastPage = pagesCountMap.indexOf(pagesCountMap.size())
            if (indexOfLastPage != pagesCountMap.size() - 1) {
                def currentLastPage = pagesCountMap[pagesCountMap.size() - 1]
                pagesCountMap[pagesCountMap.size() - 1] = pagesCountMap.size()
                pagesCountMap[indexOfLastPage] = currentLastPage
            }

            RequestContextHolder.currentRequestAttributes().getSession()[params.pageListSessionKey] = pagesCountMap.unique()
        }

//        def randomizedStart = params.start
        def pagesCountMap = RequestContextHolder.currentRequestAttributes().getSession()[params.pageListSessionKey]
        def productIds = []
        if (pagesCountMap[(params.start / params.pageSize)?.toInteger()] != null) {
            def randomizedStart = pagesCountMap[(params.start / params.pageSize)?.toInteger()] - 1
            randomizedStart = randomizedStart || randomizedStart == 0 ? randomizedStart * params.pageSize : 9999999
            productIds = products.aggregate(
                    [$match: params.match],
                    [$sort: [status: 1, sortOrder: 1]],
                    [$skip: randomizedStart],
                    [$limit: params.pageSize]
            ).results().collect { it.baseProductId }
        }

        [totalPages: totalPages, productIds: productIds]
    }

    def listProducts(params) {

        def products = getProducts()
        params.match["displayInList"] = true

        def totalPages = pagesCount(params.match, params.pageSize)
        def productIds = products.aggregate(
                [$match: params.match],
                [$sort: [status: 1, sortOrder: 1]],
                [$skip: params.start],
                [$limit: params.pageSize]
        ).results().collect { it.baseProductId }

//        println('page size:' + params.pageSize)
//        println('productIds:' + productIds)

        [totalPages: totalPages, productIds: productIds]
    }

    def shuffleArray(array, start, end) {
        if (end <= start + 1)
            return []

        def tempArray = array[(start ?: 0)..end - 1]
        Collections.shuffle(tempArray)
        tempArray
    }

//    @Cacheable(value='service', key='#cacheKey.toString()')
    def findProductTypeFilters(ProductType productType, page, cacheKey) {
        def match = productType ? ['productTypes.id': productType.id] : [:]
        def brandsCountMap = countProducts(group: [id: '$brand.id', name: '$brand.name'], match: match).findAll { it._id.name != null }

        def attributesCountMap = [:]
        def pt = productType
        while (pt) {
            attributesCountMap = attributesCountMap + countAttributes(pt, match)
            pt = pt.parentProduct
        }
        def start = Integer.parseInt(page.toString()) * grailsApplication.config.page.size
        def session = RequestContextHolder.currentRequestAttributes().getSession()
        def pageListSessionKey = "pageList_browse_${productType}"
        def resetPagesCountMap = (start == 0) || !(session[pageListSessionKey])
        def products = listProducts(match: match, start: start, pageSize: grailsApplication.config.page.size, pageListSessionKey: pageListSessionKey, resetPagesCountMap: resetPagesCountMap)
        [brands: brandsCountMap, attributes: attributesCountMap, variations: countVariations(match), products: products]
    }

//    @Cacheable(value='service', key='#cacheKey.toString()')
    def findFilteredPageFilters(f, priceFrom, priceTo, page, cacheKey) {
        def productType
        def breadcrumb = []
        def match = [:]
        def selecteds = [:]
        def growingFilter = ""

        if(priceFrom){
            if(priceTo){
                match.put('price', [$gte: priceFrom?.toString()?.replace(',', '')?.toInteger(), $lte: priceTo?.toString()?.replace(',', '')?.toInteger()])
            }
            else{
                match.put('price', [$gte: priceFrom?.toString()?.replace(',', '')?.toInteger()])
            }
        }
        else if(priceTo){
            match.put('price', [$lte: priceTo?.toString()?.replace(',', '')?.toInteger()])
        }

        def raw_filters = f.split(",")
        def filterPartsMap = [:]
        def filterIndexes = [:]
        raw_filters.eachWithIndex { it, index ->
            if (it.startsWith("p")) {
                filterPartsMap[it] = 1
                filterIndexes[it] = index
            } else if (it.startsWith("b")) {
                filterPartsMap["b"] = (filterPartsMap["b"] ?: []) + it.replace("b", "")
                filterIndexes["b"] = index
            } else if (it.startsWith("t")) {
                filterPartsMap["t"] = (filterPartsMap["t"] ?: []) + it.replace("t", "")
                filterIndexes["t"] = index
            } else {
                def filter_parts = it.split("\\|")
                filterPartsMap[filter_parts[0]] = (filterPartsMap[filter_parts[0]] ?: []) + filter_parts[1]
                filterIndexes[filter_parts[0]] = index
            }
        }

        def sortedFilterKeys = filterIndexes.keySet().sort { a, b -> filterIndexes[a] <=> filterIndexes[b] }
        def sortedFilters = []
        sortedFilterKeys.each { filterKey ->
            if (filterKey.startsWith("p"))
                sortedFilters << filterKey
            else if (filterKey == "b") {
                filterPartsMap["b"].each {
                    sortedFilters << "b${it}"
                }
            } else if (filterKey == "t") {
                filterPartsMap["t"].each {
                    sortedFilters << "t${it}"
                }
            } else {
                filterPartsMap[filterKey].each {
                    sortedFilters << "${filterKey}|${it}"
                }
            }
        }
        def lastbc = ""
        sortedFilters.each { String filter ->
            if (!growingFilter)
                growingFilter = filter
            else
                growingFilter += "," + filter
            if (filter.startsWith("p")) {
                def productTypeId = Long.parseLong(filter.replace("p", ""))
                match['productTypes.id'] = productTypeId
                productType = ProductType.get(productTypeId)

                if (!breadcrumb) {
                    def pt = productType
                    while (pt) {
                        breadcrumb << [linkTail: "browse/${pt.urlName}", linkTitle: pt.name]
                        pt = pt.parentProduct
                    }
                    breadcrumb = breadcrumb.reverse()
                } else {
                    breadcrumb << [linkTail: "filter?f=${growingFilter}", linkTitle: productType.name]
                }
                lastbc = "p"
            } else if (filter.startsWith("b")) {
                def brandId = Long.parseLong(filter.replace("b", ""))
                if (!match['brand.id'])
                    match['brand.id'] = brandId
                else if (match['brand.id'] instanceof Long)
                    match['brand.id'] = [$in: [match['brand.id'], brandId]]
                else match['brand.id'] = [$in: match['brand.id'].$in + brandId]
                selecteds["b"] = (selecteds["b"] ?: []) + brandId

                if (lastbc == "b")
                    breadcrumb[-1] = [linkTail: "filter?f=${growingFilter}", linkTitle: "${breadcrumb[-1].linkTitle} + ${Brand.get(brandId).name}"]
                else
                    breadcrumb << [linkTail: "filter?f=${growingFilter}", linkTitle: Brand.get(brandId).name]
                lastbc = "b"
            } else if (filter.startsWith("t")) {
                def typeId = Long.parseLong(filter.replace("t", ""))
                if (!match['type.id'])
                    match['type.id'] = typeId
                else if (match['type.id'] instanceof Long)
                    match['type.id'] = [$in: [match['type.id'], typeId]]
                else match['type.id'] = [$in: match['type.id'].$in + typeId]
                selecteds["t"] = (selecteds["t"] ?: []) + typeId

                if (lastbc == "t")
                    breadcrumb[-1] = [linkTail: "filter?f=${growingFilter}", linkTitle: "${breadcrumb[-1].linkTitle} + ${ProductTypeType.get(typeId).title}"]
                else
                    breadcrumb << [linkTail: "filter?f=${growingFilter}", linkTitle: ProductTypeType.get(typeId)?.title]
                lastbc = "t"
            } else if (filter.startsWith("c")) {
                def filterParts = filter.split("\\|")

                if (!match["a${filterParts[0]}.name"])
                    match["a${filterParts[0]}.name"] = filterParts[1]
                else if (match["a${filterParts[0]}.name"] instanceof String)
                    match["a${filterParts[0]}.name"] = [$in: [match["a${filterParts[0]}.name"], filterParts[1]]]
                else match["a${filterParts[0]}.name"] = [$in: match["a${filterParts[0]}.name"].$in + filterParts[1]]


                def attributeCategoryId = Long.parseLong(filterParts[0].replace("c", ""))
                selecteds[attributeCategoryId] = (selecteds[attributeCategoryId] ?: []) + filterParts[1]

                if (lastbc == "a${filterParts[0]}")
                    breadcrumb[-1] = [linkTail: "filter?f=${growingFilter}", linkTitle: "${breadcrumb[-1].linkTitle} + ${filterParts[1]}"]
                else
                    breadcrumb << [linkTail: "filter?f=${growingFilter}", linkTitle: filterParts[1]]
                lastbc = "a${filterParts[0]}"
            } else if (filter.startsWith("v")) {
                def filterParts = filter.split("\\|")

                if (!match["${filterParts[0]}"])
                    match["${filterParts[0]}"] = [$elemMatch: [name: [$in: [filterParts[1]]]]]
                else match["${filterParts[0]}"] = [$elemMatch: [name: [$in: match["${filterParts[0]}"].$elemMatch.name.$in + filterParts[1]]]]

                def variationGroupId = Long.parseLong(filterParts[0].replace("v", ""))
                selecteds[variationGroupId] = (selecteds[variationGroupId] ?: []) + filterParts[1]

                if (lastbc == "${filterParts[0]}")
                    breadcrumb[-1] = [linkTail: "filter?f=${growingFilter}", linkTitle: "${breadcrumb[-1].linkTitle} + ${filterParts[1]}"]
                else
                    breadcrumb << [linkTail: "filter?f=${growingFilter}", linkTitle: filterParts[1]]
                lastbc = "${filterParts[0]}"

            } else {
                def filterParts = filter.split("\\|")

                if (!match["a${filterParts[0]}"])
                    match["a${filterParts[0]}"] = filterParts[1]
                else if (match["a${filterParts[0]}"] instanceof String)
                    match["a${filterParts[0]}"] = [$in: [match["a${filterParts[0]}"], filterParts[1]]]
                else match["a${filterParts[0]}"] = [$in: match["a${filterParts[0]}"].$in + filterParts[1]]


                def attributeId = Long.parseLong(filterParts[0])
                selecteds[attributeId] = (selecteds[attributeId] ?: []) + filterParts[1]

                if (lastbc == "a${filterParts[0]}")
                    breadcrumb[-1] = [linkTail: "filter?f=${growingFilter}", linkTitle: "${breadcrumb[-1].linkTitle} + ${filterParts[1]}"]
                else
                    breadcrumb << [linkTail: "filter?f=${growingFilter}", linkTitle: filterParts[1]]
                lastbc = "a${filterParts[0]}"
            }
        }


        def r = match.remove('brand.id')
        def brandsCountMap = countProducts(group: [id: '$brand.id', name: '$brand.name'], match: match).findAll { it._id.name != null }
        if (r)
            match.put('brand.id', r)

        def allProductTypesCountMap = countProductsWithUnwind(group: [id: '$productTypes.id', name: '$productTypes.name'], unwind: "\$productTypes", match: match)
        def childProductTypeIds = productType ? productType.children.collect { it.id } : ProductType.findAllByParentProductIsNull().collect { it.id }
        if (productType)
            ProductType.createCriteria().listDistinct {
                godFathers {
                    eq('id', productType.id)
                }
            }.each {
                childProductTypeIds.add(it.id)
            }
        def productTypesCountMap = []
        allProductTypesCountMap.each {
            if (childProductTypeIds.contains(it._id.id))
                productTypesCountMap << it
        }

        def attributesCountMap = [:]
        def pt = productType
        while (pt) {
            attributesCountMap = attributesCountMap + countAttributes(pt, match)
            pt = pt.parentProduct
        }

        def start = Integer.parseInt(page.toString()) * grailsApplication.config.page.size
        def session = RequestContextHolder.currentRequestAttributes().getSession()
        def pageListSessionKey = "pageList_filter_${f}"
        def resetPagesCountMap = (start == 0) || !(session[pageListSessionKey])
        def products = listProducts(match: match, start: start, pageSize: grailsApplication.config.page.size, pageListSessionKey: pageListSessionKey, resetPagesCountMap: resetPagesCountMap)

        [brands: brandsCountMap, attributes: attributesCountMap, variations: countVariations(match), productTypes: productTypesCountMap, breadcrumb: breadcrumb, selecteds: selecteds, products: products]
    }

    def countAttributes(ProductType productType, match) {
        def result = [:]

        def attributeTypeList = productType ? AttributeType.findAllByProductType(productType) : AttributeType.findAllByProductTypeIsNull()

        def attrIds = attributeTypeList.asList().findAll { it.showPositions.contains("filter") }.collect { it.id }
        attrIds.each { attrId ->
            def r = match.remove('a' + attrId)
            def attributeType = AttributeType.get(attrId)
            result.put(attrId, [type: 'a', name: attributeType, sortIndex: attributeType.sortIndex, countsByValue: countProducts(group: '$a' + attrId, match: match)])
            if (r)
                match.put('a' + attrId, r)
        }

        def attributeCategoryList = productType ? AttributeCategory.findAllByProductType(productType) : AttributeCategory.findAllByProductTypeIsNull()

        def attrGroupIds = attributeCategoryList.asList().findAll { it.showPositions.contains("filter") }.collect { it.id }
        attrGroupIds.each { attrGroupId ->
            def r = match.remove('ac' + attrGroupId)
            def attributeCategory = AttributeCategory.get(attrGroupId)
            result.put(attrGroupId, [type: 'ac', name: attributeCategory, sortIndex: attributeCategory.sortIndex, countsByValue: countProductsWithUnwind(group: '$ac' + attrGroupId + '.name', unwind: '$ac' + attrGroupId, match: match)])
            if (r)
                match.put('ac' + attrGroupId, r)
        }

        result = result.sort { it.value.sortIndex }

        result
    }

    def countVariations(match) {
        def result = [:]

        def variationGroupList = VariationGroup.findAll()

        def varIds = variationGroupList.asList().findAll { it.showInFilter }.collect { it.id }
        varIds.each { varId ->
            def r = match.remove('v' + varId)
            def variationGroup = VariationGroup.get(varId)
            result.put(varId, [type: 'v', name: variationGroup, countsByValue: countProductsWithUnwind(group: '$v' + varId + '.name', match: match, unwind: '$v' + varId)])
            if (r)
                match.put('v' + varId, r)
        }
        result
    }

    def search(params) {
        def page = (params.page as Integer) ?: 0
        def pageSize = 20
        def start = page * pageSize

        def match = [:]
        def productTypeId
        def brandId
        if ((params.brandId as Integer) > -1) {
            brandId = params.brandId as Integer
            match['brand.id'] = brandId
        }

        if ((params.productTypeId as Integer) > -1) {
            productTypeId = params.productTypeId as Integer
            match['productTypes.id'] = productTypeId
        }

        def attParams = params.findAll { key, val -> key.startsWith("ATT") }
        attParams.each { key, val ->
            match.put(key.replace("ATT", ""), val)
        }

        def products = getProducts()
        params.match["displayInList"] = true
        def brands = products.aggregate(
                [$match: match],
                [$group: [_id: '$brand.id', count: [$sum: 1]]],
                [$sort: [count: -1]]
        ).results().collect { it._id }

        def productTypes = products.aggregate(
                [$match: match],
                [$unwind: '$productTypes'],
                [$match: ['productTypes.parentId': productTypeId]],
                [$group: [_id: '$productTypes.id', count: [$sum: 1]]],
                [$sort: [count: -1]]
        ).results().collect { it._id }

        def productIds = products.aggregate(
                [$match: match],
                [$skip: start],
                [$limit: pageSize]
        ).results().collect { it.baseProductId }

        def totalPages = (products.aggregate(
                [$match: match],
                [$group: [_id: null, count: [$sum: 1]]]
        ).results().collect { it.count }.find() ?: 0) / pageSize

        def attrs = [:]
        def attrGroups = [:]
        if (productTypeId) {
            def pt = ProductType.get(productTypeId)
            def attrNames = AttributeType.findAllByProductType(pt).asList().findAll { it.showPositions.contains("filter") }.collect { it.name }
            attrNames.each { attr ->
                def attrValues = products.aggregate(
                        [$match: match],
                        [$group: [_id: '$' + attr, count: [$sum: 1]]],
                        [$match: [count: [$gt: 0], _id: [$ne: null]]],
                        [$sort: [count: -1]]
                ).results().collect { it._id }
                attrs[attr] = attrValues
            }

            def attrGroupNames = AttributeCategory.findAllByProductType(pt).asList().findAll { it.showPositions.contains("filter") }.collect { it.name }
            attrGroupNames.each { attrGroup ->
                def attrValues = products.aggregate(
                        [$match: match],
                        [$unwind: '$' + attrGroup],
                        [$group: [_id: '$' + attrGroup, count: [$sum: 1]]],
                        [$match: [count: [$gt: 0], _id: [$ne: null]]],
                        [$sort: [count: -1]]
                ).results().collect { it._id }
                attrGroups[attrGroup] = attrValues
            }

        }
        [productTypes: productTypes, brands: brands,
                productIds: productIds, attrs: attrs, attrGroups: attrGroups, totalPages: totalPages]
    }

//    @Cacheable(value='service', key='#cacheKey.toString()')
    def findSearchPageFilters(productIdList, f, priceFrom, priceTo, page, cacheKey) {
        def productType
        def breadcrumb = []
        def selecteds = [:]
        def growingFilter = ""

        def match = [baseProductId: [$in: productIdList]]

        if(priceFrom){
            if(priceTo){
                match.put('price', [$gte: priceFrom?.toString()?.replace(',', '')?.toInteger(), $lte: priceTo?.toString()?.replace(',', '')?.toInteger()])
            }
            else{
                match.put('price', [$gte: priceFrom?.toString()?.replace(',', '')?.toInteger()])
            }
        }
        else if(priceTo){
            match.put('price', [$lte: priceTo?.toString()?.replace(',', '')?.toInteger()])
        }

        if (f instanceof String[])
            f = f[f.length - 1]

        def raw_filters = f.split(",")
        def filterPartsMap = [:]
        def filterIndexes = [:]
        raw_filters.eachWithIndex { it, index ->
            if (it.startsWith("p")) {
                filterPartsMap[it] = 1
                filterIndexes[it] = index
            } else if (it.startsWith("b")) {
                filterPartsMap["b"] = (filterPartsMap["b"] ?: []) + it.replace("b", "")
                filterIndexes["b"] = index
            } else if (it.startsWith("t")) {
                filterPartsMap["t"] = (filterPartsMap["t"] ?: []) + it.replace("t", "")
                filterIndexes["t"] = index
            } else {
                def filter_parts = it.split("\\|")
                filterPartsMap[filter_parts[0]] = (filterPartsMap[filter_parts[0]] ?: []) + filter_parts[1]
                filterIndexes[filter_parts[0]] = index
            }
        }

        def sortedFilterKeys = filterIndexes.keySet().sort { a, b -> filterIndexes[a] <=> filterIndexes[b] }
        def sortedFilters = []
        sortedFilterKeys.each { filterKey ->
            if (filterKey.startsWith("p"))
                sortedFilters << filterKey
            else if (filterKey == "b") {
                filterPartsMap["b"].each {
                    sortedFilters << "b${it}"
                }
            } else if (filterKey == "t") {
                filterPartsMap["t"].each {
                    sortedFilters << "t${it}"
                }
            } else {
                filterPartsMap[filterKey].each {
                    sortedFilters << "${filterKey}|${it}"
                }
            }
        }
        def lastbc = ""
        sortedFilters.each { String filter ->
            if (!growingFilter)
                growingFilter = filter
            else
                growingFilter += "," + filter
            if (filter.startsWith("p")) {
                def productTypeId = Long.parseLong(filter.replace("p", ""))
                if (productTypeId != 0) {
                    match['productTypes.id'] = productTypeId
                    productType = ProductType.get(productTypeId)

                    if (!breadcrumb) {
                        def pt = productType
                        while (pt) {
                            breadcrumb << [linkTail: "browse/${pt.urlName}", linkTitle: pt.name]
                            pt = pt.parentProduct
                        }
                        breadcrumb = breadcrumb.reverse()
                    } else {
                        breadcrumb << [linkTail: "filter?f=${growingFilter}", linkTitle: productType.name]
                    }
                }
                lastbc = "p"
            } else if (filter.startsWith("b")) {
                def brandId = Long.parseLong(filter.replace("b", ""))
                if (!match['brand.id'])
                    match['brand.id'] = brandId
                else if (match['brand.id'] instanceof Long)
                    match['brand.id'] = [$in: [match['brand.id'], brandId]]
                else match['brand.id'] = [$in: match['brand.id'].$in + brandId]
                selecteds["b"] = (selecteds["b"] ?: []) + brandId

                if (lastbc == "b")
                    breadcrumb[-1] = [linkTail: "filter?f=${growingFilter}", linkTitle: "${breadcrumb[-1].linkTitle} + ${Brand.get(brandId).name}"]
                else
                    breadcrumb << [linkTail: "filter?f=${growingFilter}", linkTitle: Brand.get(brandId).name]
                lastbc = "b"
            } else if (filter.startsWith("t")) {
                def typeId = Long.parseLong(filter.replace("t", ""))
                if (!match['type.id'])
                    match['type.id'] = typeId
                else if (match['type.id'] instanceof Long)
                    match['type.id'] = [$in: [match['type.id'], typeId]]
                else match['type.id'] = [$in: match['type.id'].$in + typeId]
                selecteds["t"] = (selecteds["t"] ?: []) + typeId

                if (lastbc == "t")
                    breadcrumb[-1] = [linkTail: "filter?f=${growingFilter}", linkTitle: "${breadcrumb[-1].linkTitle} + ${ProductTypeType.get(typeId).title}"]
                else
                    breadcrumb << [linkTail: "filter?f=${growingFilter}", linkTitle: ProductTypeType.get(typeId)?.title]
                lastbc = "t"
            } else if (filter.startsWith("c")) {
                def filterParts = filter.split("\\|")

                if (!match["a${filterParts[0]}.name"])
                    match["a${filterParts[0]}.name"] = filterParts[1]
                else if (match["a${filterParts[0]}.name"] instanceof String)
                    match["a${filterParts[0]}.name"] = [$in: [match["a${filterParts[0]}.name"], filterParts[1]]]
                else match["a${filterParts[0]}.name"] = [$in: match["a${filterParts[0]}.name"].$in + filterParts[1]]


                def attributeCategoryId = Long.parseLong(filterParts[0].replace("c", ""))
                selecteds[attributeCategoryId] = (selecteds[attributeCategoryId] ?: []) + filterParts[1]

                if (lastbc == "a${filterParts[0]}")
                    breadcrumb[-1] = [linkTail: "filter?f=${growingFilter}", linkTitle: "${breadcrumb[-1].linkTitle} + ${filterParts[1]}"]
                else
                    breadcrumb << [linkTail: "filter?f=${growingFilter}", linkTitle: filterParts[1]]
                lastbc = "a${filterParts[0]}"
            } else if (filter.startsWith("v")) {
                def filterParts = filter.split("\\|")

                if (!match["${filterParts[0]}"])
                    match["${filterParts[0]}"] = [$elemMatch: [name: [$in: [filterParts[1]]]]]
                else match["${filterParts[0]}"] = [$elemMatch: [name: [$in: match["${filterParts[0]}"].$elemMatch.name.$in + filterParts[1]]]]

                def variationGroupId = Long.parseLong(filterParts[0].replace("v", ""))
                selecteds[variationGroupId] = (selecteds[variationGroupId] ?: []) + filterParts[1]

                if (lastbc == "${filterParts[0]}")
                    breadcrumb[-1] = [linkTail: "filter?f=${growingFilter}", linkTitle: "${breadcrumb[-1].linkTitle} + ${filterParts[1]}"]
                else
                    breadcrumb << [linkTail: "filter?f=${growingFilter}", linkTitle: filterParts[1]]
                lastbc = "${filterParts[0]}"
            } else {
                def filterParts = filter.split("\\|")

                if (!match["a${filterParts[0]}"])
                    match["a${filterParts[0]}"] = filterParts[1]
                else if (match["a${filterParts[0]}"] instanceof String)
                    match["a${filterParts[0]}"] = [$in: [match["a${filterParts[0]}"], filterParts[1]]]
                else match["a${filterParts[0]}"] = [$in: match["a${filterParts[0]}"].$in + filterParts[1]]


                def attributeId = Long.parseLong(filterParts[0])
                selecteds[attributeId] = (selecteds[attributeId] ?: []) + filterParts[1]

                if (lastbc == "a${filterParts[0]}")
                    breadcrumb[-1] = [linkTail: "filter?f=${growingFilter}", linkTitle: "${breadcrumb[-1].linkTitle} + ${filterParts[1]}"]
                else
                    breadcrumb << [linkTail: "filter?f=${growingFilter}", linkTitle: filterParts[1]]
                lastbc = "a${filterParts[0]}"
            }
        }

        def r = match.remove('brand.id')
        def brandsCountMap = countProducts(group: [id: '$brand.id', name: '$brand.name'], match: match).findAll { it._id.name != null }
        if (r)
            match.put('brand.id', r)

        def allProductTypesCountMap = countProductsWithUnwind(group: [id: '$productTypes.id', name: '$productTypes.name'], unwind: "\$productTypes", match: match)
        def childProductTypeIds = productType ? productType.children.collect { it.id } : ProductType.findAllByParentProductIsNull().collect { it.id }
        if (productType)
            ProductType.createCriteria().listDistinct {
                godFathers {
                    eq('id', productType.id)
                }
            }.each {
                childProductTypeIds.add(it.id)
            }
        def productTypesCountMap = []
        allProductTypesCountMap.each {
            if (childProductTypeIds.contains(it._id.id))
                productTypesCountMap << it
        }


        def attributesCountMap = [:]
        def pt = productType
        while (pt) {
            attributesCountMap = attributesCountMap + countAttributes(pt, match)
            pt = pt.parentProduct
        }

        def start = Integer.parseInt(page.toString()) * grailsApplication.config.page.size
        def session = RequestContextHolder.currentRequestAttributes().getSession()
        def pageListSessionKey = "pageList_search_${f}"
        def resetPagesCountMap = (start == 0) || !(session[pageListSessionKey])
        def products = listProducts(match: match, start: start, pageSize: grailsApplication.config.page.size, pageListSessionKey: pageListSessionKey, resetPagesCountMap: resetPagesCountMap)

        [brands: brandsCountMap, attributes: attributesCountMap, variations: countVariations(match), productTypes: productTypesCountMap, breadcrumb: breadcrumb, selecteds: selecteds, products: products]
    }

    def breadCrumb(params) {
        def productType = ProductType.get(params.browsingProductTypeId)
        def result = []
        while (productType?.parentProduct != null) {
            result << [id: productType.id, name: productType.name]
            productType = productType.parentProduct
        }
        result.reverse()
    }

    def getAllSubProductTypes(ProductType productType) {
        BrowseHelper.getAllSubProductTypes(productType)
    }

    def brandList(Long productTypeId) {
        def match = productTypeId ? ['productTypes.id': productTypeId] : [:]
        countProducts(group: [id: '$brand.id', name: '$brand.name'], match: match).findAll { it._id.name != null }
    }

    def minPrice(Long productTypeId) {
        products.aggregate([$unwind: '$productTypes'], [$match: [displayInList: true, 'productTypes.id': productTypeId, 'price': [$gt: 0]]], [$group: [_id: null, minPrice: [$min: '$price']]]).results().collect { it.minPrice }.find() ?: 0
    }

    def findProductTypeSampleProducts(ProductType productType, count) {
        def match = productType ? ['productTypes.id': productType.id] : [:]
        listProducts(match: match, start: 0, pageSize: count)
    }
}
