package eshop

import org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib

class InternalLinkingService {

    List renderLinks(params) {
        getLinksList(params).collect { link ->
            if (link?.uri)
                [title: link?.title, url: new ApplicationTagLib().createLink(uri: link?.uri)]
            else
                [title: link?.title, url: new ApplicationTagLib().createLink(controller: link?.controller, action: link?.action, params: link?.params)]
        }
    }

    List<InternalLink> getLinksList(params) {
        if (params?.productType) {
            def productType = params?.productType ? ProductType.findBySeoFriendlyNameAndDeleted(params?.productType as String, false) ?: ProductType.findBySeoFriendlyAlternativeName(params?.productType as String) ?: ProductType.findByName(params?.productType as String) : null
            return productType ? getProductTypeLinks(productType, false) : []
        }

        if (params?.f) {
            def fParams = params?.f?.toString()?.split(',')
            def productType = ProductType.get(fParams?.find { it?.startsWith('p') }?.replace('p', '') as Long)
            def brand = Brand.get(fParams.find { it?.startsWith('b') }?.replace('b', '') as Long)
            if (productType)
                return getProductTypeLinks(productType, true)
            else if (brand)
                return getBrandLinks(brand)
        }

        []
    }

    List<InternalLink> getProductTypeLinks(ProductType productType, Boolean showMainProductType) {
        def list = new ArrayList<InternalLink>()

        //product type links
        if (showMainProductType)
            list << new InternalLink(productType.name, "/browse/${productType.seoFriendlyName}")

        getChildProductTypes(productType).each { pt ->
            def brands = getProductTypeBrands(pt)
            brands.each { Brand brand ->
                list << new InternalLink("${pt?.name} ${brand?.name}", 'site', 'filter', [f: "p${pt?.id},b${brand?.id}", o: 'b'])
            }
            brands.each { Brand brand ->
                list << new InternalLink("${brand?.name}", 'site', 'filter', [f: "b${brand?.id}", o: 'b'])
            }
        }

        //parent product type links
        def parentProductType = productType?.parentProduct
        if (parentProductType) {

            list << new InternalLink(parentProductType?.name, "/browse/${parentProductType.seoFriendlyName}")

            def parentBrands = getProductTypeBrands(parentProductType)
            parentBrands?.each { Brand brand ->
                list << new InternalLink("${parentProductType?.name} ${brand?.name}", 'site', 'filter', [f: "p${parentProductType?.id},b${brand?.id}", o: 'b'])
            }
        }

        //static links
        list << new InternalLink("فروشگاه اینترنتی ${productType?.name}", '')
        list << new InternalLink("خرید اینترنتی ${productType?.name}", '')

        list
    }

    List<InternalLink> getBrandLinks(Brand brand) {
        Product.createCriteria().listDistinct {
            notEqual('deleted', true)
            eq('isVisible', true)
            notEqual('brand', brand)
            projections {
                property('brand')
            }
        }?.collect { Brand b ->
            new InternalLink(b?.name, 'site', 'filter', [f: "b${b?.id}", o: 'b'])
        }
    }

    List<ProductType> getChildProductTypes(ProductType productType) {
        def list = [productType] as Set
        def children = ProductType.findAllByParentProductInList(list?.toList())
        while (children && children?.size()) {
            list?.addAll(children)
            children = ProductType.findAllByParentProductInListAndIdNotInList(list?.toList(), list?.collect { it?.id })
        }
        list?.toList()
    }

    List<Brand> getProductTypeBrands(ProductType productType) {
        Product.createCriteria().listDistinct {
            notEqual('deleted', true)
            eq('isVisible', true)
            isNotNull('brand')
            productTypes {
                inList('id', getChildProductTypes(productType)?.collect { it?.id })
            }
            projections {
                property('brand')
            }
        }?.findAll { it && it.name } ?: []
    }
}
