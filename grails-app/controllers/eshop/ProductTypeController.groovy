package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON
import grails.plugins.springsecurity.Secured
import org.springframework.transaction.annotation.Transactional

@Secured(RoleHelper.ROLE_PRODUCT_TYPE_ADMIN)
class ProductTypeController {
    def imageService
    def fileService
    def mongoService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [productTypeInstanceList: ProductType.list(params), productTypeInstanceTotal: ProductType.count()]
    }

    def create() {
        ProductType parentProduct;
        if (params.parentId)
            parentProduct = ProductType.get(params.parentId);
        [productTypeInstance: new ProductType(params), parentProduct: parentProduct]
    }

    def save() {
        def productTypeInstance = new ProductType(params)
        if (!productTypeInstance.save(flush: true)) {
            render(view: "create", model: [productTypeInstance: productTypeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'productType.label', default: 'ProductType'), productTypeInstance.id])
        redirect(action: "show", id: productTypeInstance.id)
    }

    def getProductType() {
        render ProductType.get(params.id) as JSON
    }

    def show(Long id) {
        def productTypeInstance = ProductType.get(id)
        if (!productTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productType.label', default: 'ProductType'), id])
            redirect(action: "list")
            return
        }

        [productTypeInstance: productTypeInstance]
    }

    def edit(Long id) {
        def productTypeInstance = ProductType.get(id)
        if (!productTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productType.label', default: 'ProductType'), id])
            redirect(action: "list")
            return
        }

        [productTypeInstance: productTypeInstance]
    }

    def update(Long id, Long version) {
        def productTypeInstance = ProductType.get(id)
        if (!productTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productType.label', default: 'ProductType'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (productTypeInstance.version > version) {
                productTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'productType.label', default: 'ProductType')] as Object[],
                        "Another user has updated this ProductType while you were editing")
                render(view: "edit", model: [productTypeInstance: productTypeInstance])
                return
            }
        }

        productTypeInstance.properties = params

        if (!productTypeInstance.save(flush: true)) {
            render(view: "edit", model: [productTypeInstance: productTypeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'productType.label', default: 'ProductType'), productTypeInstance.id])
        redirect(action: "show", id: productTypeInstance.id)
    }

    def setAttValueToProducts_form() {
        def attributeType = AttributeType.get(params.id)
        boolean setNewValue
        String newValue
        boolean nA

        render(template: "set_att_value_to_products", model: [attributeType: attributeType, setNewValue: setNewValue, newValue: newValue, nA: nA])
    }

    def setAttValueToProducts_save() {
        def attributeType = AttributeType.get(params.id)

        def productType = attributeType?.productType
        def setNewValue = params.setNewValue
        def newValue = (params.nA == "on") ? "N/A" : params.newValue

        productType.products.findAll().each {
            def attribute = it.attributes.find { atr -> atr.attributeType.id == attributeType.id }
            if (!attribute) {
                attribute = new Attribute(attributeType: attributeType, product: it)

                def attributeValue = AttributeValue.findByValue(newValue)

                attribute.value = attributeValue ?: new AttributeValue(value: newValue).save()
                if (!attributeValue) {
                    attributeType.addToValues(attribute.value)
                    attributeType.save()
                }

                attribute.save()

                //    it.attributes.add(attribute)

                it.isSynchronized = false
                it.save()

//            if (!attribute) {
//                def attributeValue
//                if(!attributeType.values.collect{it.value}.contains((nA) ? "N/A" : newValue)){
//                    attributeValue = new AttributeValue()
//                    attributeValue.value = (nA) ? "N/A" : newValue
//                    attributeValue.save()
//
//                    attributeType.addToValues(attributeValue)
//                    attributeType.save()
//                }
//                else{
//                    attributeValue = attributeType.values.find {v -> v.value == ((nA) ? "N/A" : newValue)}
//                }
//
//                def newAttr = new Attribute()
//                newAttr.attributeType = attributeType
//                newAttr.product = it
//                newAttr.value = attributeValue
//
//                if (newAttr.save()) {
//                    mongoService.storeProduct(it)
//                }
//            }
            }
        }
    }

    def attributeCategoryForm() {
        def attributeCategory
        if (params.id)
            attributeCategory = AttributeCategory.get(params.id)
        else {
            attributeCategory = new AttributeCategory(params)
            if (!attributeCategory.productType)
                attributeCategory.productType = attributeCategory.parentCategory.productType
        }
        render(template: "form_AttributeCategory", model: [attributeCategory: attributeCategory])
    }

    def saveAttributeCategory() {
        def attributeCategory
        if (params.id) {
            attributeCategory = AttributeCategory.get(params.id)
            attributeCategory.properties = params
        } else
            attributeCategory = new AttributeCategory(params)
        if (attributeCategory.validate() && attributeCategory.save()) {
            render attributeCategory as JSON
        } else {
            render(template: "form_AttributeCategory", model: [attributeCategory: attributeCategory])
        }
        attributeCategory.productType.products.each {
            it.isSynchronized = false
            it.save()
        }
    }

    def deleteAttributeCategory() {
        try {

            def attributecategory = AttributeCategory.get(params.id)
            AttributeType.findAllByCategory(attributecategory).each {
                it.category = null
                it.save()
            }
            attributecategory.deleted = true
            attributecategory.save()
            render 0
            attributecategory.productType.products.each {
                it.isSynchronized = false
                it.save()
            }
        } catch (x) {
            x.printStackTrace()
            render(message(code: "cannot.delete"))
        }

    }

    def delete(Long id) {
        def productTypeInstance = ProductType.get(id)
        if (!productTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productType.label', default: 'ProductType'), id])
            redirect(action: "list")
            return
        }

        try {
            productTypeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'productType.label', default: 'ProductType'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'productType.label', default: 'ProductType'), id])
            redirect(action: "show", id: id)
        }
    }

    def deleteProductType() {
        def productTypeInstance = ProductType.get(params.id)
        if (!productTypeInstance) {
            render 1;
            return
        }
        if (productTypeInstance.products.count { !it.deleted } > 0) {
            render(message(code: "producttype.contains.products"))
            return
        }
        if (productTypeInstance.children.count { !it.deleted } > 0) {
            render(message(code: "producttype.contains.children"))
            return
        }
        try {
//            if (productTypeInstance.rootProductType == productTypeInstance){
//                productTypeInstance.rootProductType = null
//                productTypeInstance.save(flush: true)
//            }
//            productTypeInstance.products.each {
//                it.removeFromProductTypes(productTypeInstance)
//                it.save()
//            }
            if (!productTypeInstance.rootProductType)
                productTypeInstance.rootProductType = productTypeInstance
            productTypeInstance.deleted = true
            productTypeInstance.save(flush: true)
            render 0;
        }
        catch (DataIntegrityViolationException e) {
            render 1;
        }
    }

    def synchProductType() {
        def pt = ProductType.get(params.id)
        pt.products.each {
            it.isSynchronized = false
            it.save()
        }
        render 0;
    }

    def deleteAttributeType() {
        def attributeTypeInstance = AttributeType.get(params.id)
        if (!attributeTypeInstance) {
            render 1;
            return
        }
        attributeTypeInstance.productType.attributeTypes
                .findAll { it.sortIndex > attributeTypeInstance.sortIndex }
                .each {
            it.sortIndex--
            it.save()
        }
        try {
            attributeTypeInstance.deleted = true
            attributeTypeInstance.save(flush: true)
            def ptid = attributeTypeInstance.productType.id


            def productType = ProductType.get(ptid)
            if (productType) {
                def productTypeIds = getChildProductTypes(ProductType.get(ptid)).collect { it.id }
                Product.createCriteria().list {
                    or {
                        isNull('deleted')
                        eq('deleted', false)
                    }
                    productTypes {
                        'in'('id', productTypeIds)
                    }
                }.each {
                    if (it instanceof Product) try {
                        it.isSynchronized = false
                        it.save()
                    } catch (x) {}
                }
            }

            render 0;
        }
        catch (DataIntegrityViolationException e) {
            e.printStackTrace()
            render 1;
        }
    }

    def deleteProduct() {
        def productInstance = Product.get(params.id)
        if (!productInstance) {
            render 1;
            return
        }

        try {
            productInstance.delete(flush: true)
            render 0;
        }
        catch (DataIntegrityViolationException e) {
            render 1;
        }
    }

    def saveProductType() {
        ProductType productType
        try {
            def image
            def menuImage
            def mobileBanner
            if (params.id) {
                productType = ProductType.get(params.id)
                image = productType.image
                menuImage = productType.menuImage
                mobileBanner = productType.mobileBanner
                productType.properties = params
                productType.seoFriendlyName = params.seoFriendlyName
            } else {
                productType = new ProductType(params)
            }

            productType.image = null
            productType.menuImage = null
            productType.mobileBanner = null
            productType.rootProductType = productType.parentProduct ? productType.parentProduct.rootProductType : productType
//            productType = productType.save()
            if (!params.imagedeleted) {
                if (params.image)
                    productType.image = imageService.saveAndScaleImages(params.image.bytes, "image", fileService.filePath(productType))
                else if (image)
                    productType.image = image
            }
            if (!params.menuImageDeleted) {
                if (params.menuImage)
                    productType.menuImage = params.menuImage.bytes
                else if (menuImage)
                    productType.menuImage = menuImage
            }
            if (!params.mobileBannerDeleted) {
                if (params.mobileBanner)
                    productType.mobileBanner = params.mobileBanner.bytes
                else if (mobileBanner)
                    productType.mobileBanner = mobileBanner
            }
            productType.searchKeys = params.searchKeys
            productType.save(flush:true)
        } catch (x) {

        }

        if (productType) {
            def productTypeIds = getChildProductTypes(productType).collect { it.id }
            Product.createCriteria().list {
                or {
                    isNull('deleted')
                    eq('deleted', false)
                }
                productTypes {
                    'in'('id', productTypeIds)
                }
            }.each {
                if (it instanceof Product) try {
                    it.isSynchronized = false
                    it.save()
                } catch (x) {}
            }
        }

        render 0;
    }

    def getChildProductTypes(ProductType productType) {
        def list = [productType]
        ProductType.findAllByParentProduct(productType).each {
            list.addAll(getChildProductTypes(it))
        }
        list
    }

    def getImage() {
        def productType = ProductType.get(params.id)
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        if (productType && productType.image) {
            response.addHeader("content-disposition", "attachment;filename=$productType.name")
            response.contentLength = productType.image.length
            response.outputStream << productType.image
        } else {
            response.contentLength = 0
            response.outputStream << []
        }

    }

    def saveProduct() {
        try {
            def product
            if (params.id) {
                product = Product.get(params.id)
                product.properties = params
            } else
                product = new Product(params)
            product.save()
            render 0;
        } catch (x) {
            render 1;
        }
    }

    def getAttributes() {
        def result = Attribute.findByProduct(Product.get(params.id));
        result as JSON;
    }

    def repairN_A() {
        def n_as = AttributeValue.findAllByValue("N/A")
        def first = n_as.first();
        n_as.each {
            if (it != first) {
                def att = Attribute.findAllByValue(it)
                att.each {
                    it.value = first
                    it.save()
                }
                it.delete()
                println att.size()
            }

        }
        render 0
    }

    def repairAttrValues() {
        def n_a = AttributeValue.findByValue("N/A")
        AttributeType.findAll().each { attr ->
            attr.attributes.collect { it.value }.unique().each {
                if (it && !attr?.values?.contains(it))
                    attr.addToValues(it)
            }
            attr.removeFromValues(n_a)
            attr.save()
            println attr
        }
        render 0;
    }

    def attributeForm() {
        def attribute
        if (params.id)
            attribute = AttributeType.get(params.id)
        else {
            attribute = new AttributeType(params)
        }
        def attributeCategories = AttributeCategory.findAllByProductTypeAndDeleted(attribute.productType, false)
        render(template: "form_Attribute", model: [attributeTypeInstance: attribute, attributeCategories: attributeCategories])
    }

    def saveAttribute() {
        def attribute;
        if (params.id) {
            attribute = Attribute.get(params.id)
            attribute.properties = params;
        } else
            attribute = new Attribute(params);
        attribute.save()
    }

    def saveAttributeType() {
        def attributeType;
        if (params.id) {
            attributeType = AttributeType.get(params.id)
            if (!params.category.id) {
                params.remove("category.id")
                attributeType.category = null
            }
            attributeType.properties = params;
        } else {
            attributeType = new AttributeType(params);
            attributeType.sortIndex = (attributeType.productType.attributeTypes.max { it.sortIndex }?.sortIndex ?: 0) + 1
        }
//        if (params.values_old && attributeType.id) {
//            params.values_old.eachWithIndex {oldVal, idx ->
//                def attributes = Attribute.findAllByAttributeTypeAndAttributeValue(attributeType, oldVal)
//                attributes.each {
//                    it.attributeValue = params.values[idx]
//                    it.save()
//                }
//            }
//        }

        //attribute value groups
        def mustRemove = []
        attributeType.groups?.each {
            if (params["valueGroups_${it.id}"]) {
                it.value = params["valueGroups_${it.id}"]
                it.save()
            } else {
                mustRemove << it
            }
        }

        attributeType.groups = attributeType.groups.findAll { group ->
            !mustRemove.collect { it.id }.contains(group.id)
        }
        mustRemove.each {
//            attributeType.groups == attributeType.groups.findAll{group -> group.id != it.id}
            it.deleted = true
            it.save()
        }

        if (params.valueGroups_ instanceof String) {
            attributeType.addToGroups(new AttributeValueGroup(value: params.valueGroups_).save())
        } else {
            params.valueGroups_.each {
                attributeType.addToGroups(new AttributeValueGroup(value: it).save())
            }
        }

        //attribute values
        mustRemove = []
        attributeType.values?.each {
            if (params["values_${it.id}"]) {
                it.value = params["values_${it.id}"]
                if (params["values_group_${it.id}"] && params["values_group_${it.id}"] != "")
                    it.group = AttributeValueGroup.get(params["values_group_${it.id}"])
                else
                    it.group = null
                it.save()
            } else {
                mustRemove << it
            }
        }
        mustRemove.each {
            attributeType.removeFromValues(it)
            Attribute.findAllByValue(it).each {
                it.value = null
                it.save()
            }
            it.delete()
        }

        if (params.values_ instanceof String) {
            def attributeValue = new AttributeValue(value: params.values_)
            if (params.values_group_ && params.values_group_ != "")
                attributeValue.group = AttributeValueGroup.get(params.values_group_)
            if (attributeValue.save())
                attributeType.addToValues(attributeValue)
        } else {
            def indexer = 0
            params.values_.each {
                def attributeValue = new AttributeValue(value: it)
                if (params["values_group_"][indexer] && params["values_group_"][indexer] != "")
                    attributeValue.group = AttributeValueGroup.get(params["values_group_"][indexer])
                if (attributeValue.save())
                    attributeType.addToValues(attributeValue)
                indexer++;
            }
        }

        //save product type
        attributeType.save()
        attributeType.productType.products.each {
            it.isSynchronized = false
            it.save()
        }
        render "0"
    }

    def getAttributeTypeValues() {
        def attributeType = AttributeType.get(params.id)
        render attributeType.values as JSON

    }

    @Secured([RoleHelper.ROLE_PRODUCT_ADMIN, RoleHelper.ROLE_PRODUCT_TYPE_ADMIN, RoleHelper.ROLE_PRODUCT_ADD, RoleHelper.ROLE_PRODUCT_ADD_EDIT])
    def getProductTypes() {
        def json = []
        def productTypes = ProductType.findAllByParentProductIsNullAndDeleted(false)
        productTypes.each {
            json << fillJson(it, params.curProductTypeId as Integer)
        }
        render json as JSON
    }

    private fillJson(productType, curId) {
        def json = [:]
        if (curId != productType.id) {
            json.data = productType.name
            json.attr = [id: productType.id]
            json.children = []
            productType.children.findAll { !it.deleted }.each {
                json.children << fillJson(it, curId)
            }
        }
        json
    }

    def moveProductType() {
        def productType = ProductType.get(params.id)
        productType.parentProduct = ProductType.get(params.parentId)
        productType.save()
        productType.products.each {
            it.isSynchronized = false
            it.save()
        }
        render 0
    }

    def details() {
        def productTypeInstance = ProductType.get(params.id)
        def giftInformation = GiftInformation.findByProductType(productTypeInstance)
        [productTypeInstance: productTypeInstance, baseProductInstance: productTypeInstance, giftInformation: giftInformation]
    }

    def saveGodFathers() {
        def productType = ProductType.get(params.id)
        productType.godFathers = productType.godFathers.findAll { params.godFathers.split(",").contains(it.id.toString()) }
        params.godFathers.split(",").each {
            if (it) {
                productType.godFathers.add(ProductType.get(it))
            }
        }
        productType.save()

        //products need to be resynchized
        if (productType) {
            def productTypeIds = getChildProductTypes(productType).collect { it.id }
            Product.createCriteria().list {
                or {
                    isNull('deleted')
                    eq('deleted', false)
                }
                productTypes {
                    'in'('id', productTypeIds)
                }
            }.each {
                if (it instanceof Product) try {
                    it.isSynchronized = false
                    it.save()
                } catch (x) {}
            }
        }


        render(view: "details", model: [productTypeInstance: productType, baseProductInstance: productType])
    }

//    def moveDown() {
//        def attributeType = AttributeType.get(params.id)
//        def otherAttType = attributeType.productType.attributeTypes.find {it.sortIndex == attributeType.sortIndex + 1}
//        if (otherAttType) {
//            attributeType.sortIndex++
//            attributeType.save()
//            otherAttType.sortIndex--
//            otherAttType.save()
//        }
//        render 0
//    }
//
//    def moveUp() {
//        def attributeType = AttributeType.get(params.id)
//        def otherAttType = attributeType.productType.attributeTypes.find {it.sortIndex == attributeType.sortIndex - 1}
//        if (otherAttType) {
//            attributeType.sortIndex--
//            attributeType.save()
//            otherAttType.sortIndex++
//            otherAttType.save()
//        }
//        render 0
//    }

    def countProductsForAttributeValue() {
        def attType = AttributeType.get(params.atid)
        def attValue = AttributeValue.get(params.id)
        def count = Product.createCriteria().count {
            productTypes {
                eq("id", attType.productType?.id)
            }
            attributes {
                value {
                    eq("id", attValue?.id)
                }
            }
        }
        render count
    }

    def countProductsForAttributeValueGroup() {
        def attType = AttributeType.get(params.atid)
        def attValueGroup = AttributeValueGroup.get(params.id)
        def count = 0
        attValueGroup.values.each {
            count += Product.createCriteria().count {
                productTypes {
                    eq("id", attType.productType?.id)
                }
                attributes {
                    value {
                        eq("id", attValue?.id)
                    }
                }
            }
        }
        render count
    }

    def calcSortIndex() {
        ProductType.findAll().each { productType ->
            def attrs = AttributeType.findAllByProductType(productType)
            def maxindex = (attrs.max { it.sortIndex }?.sortIndex) ?: 0
            maxindex++
            attrs.findAll { it.sortIndex == 0 }.each {
                it.sortIndex = maxindex++
                it.save()
            }

            def attrcats = AttributeCategory.findAllByProductType(productType)
            maxindex = (attrcats.max { it.sortIndex }?.sortIndex) ?: 0
            maxindex++
            attrcats.findAll { it.sortIndex == 0 }.each {
                it.sortIndex = maxindex++
                it.save()
            }
        }
        render "OK"
    }

    def moveCategoryForm() {
        def cat = AttributeCategory.get(params.id)
        render(template: "moveForm", model: [id: params.id, sortIndex: cat.sortIndex])
    }

    def moveAttributeForm() {
        def cat = AttributeType.get(params.id)
        render(template: "moveForm", model: [id: params.id, sortIndex: cat.sortIndex])
    }

    def moveCategory() {
        def cat = AttributeCategory.get(params.id)
        def sortIndex = params.sortIndex as Integer
        def lower = Math.min(sortIndex, cat.sortIndex)
        def upper = Math.max(sortIndex, cat.sortIndex)
        def i = sortIndex > cat.sortIndex ? -1 : 1
        def cats = AttributeCategory.findAllByProductTypeAndSortIndexBetween(cat.productType, lower, upper)
        cats.each {
            it.sortIndex += i
            it.save()
        }
        cat.sortIndex = sortIndex
        cat.save()
        cat.productType.products.each {
            it.isSynchronized = false
            it.save()
        }
        render 0
    }

    def moveAttribute() {
        def cat = AttributeType.get(params.id)
        def sortIndex = params.sortIndex as Integer
        def lower = Math.min(sortIndex, cat.sortIndex)
        def upper = Math.max(sortIndex, cat.sortIndex)
        def i = sortIndex > cat.sortIndex ? -1 : 1
        def cats = AttributeType.findAllByProductTypeAndSortIndexBetween(cat.productType, lower, upper)
        cats.each {
            it.sortIndex += i
            it.save()
        }
        cat.sortIndex = sortIndex
        cat.save()
        cat.productType.products.each {
            it.isSynchronized = false
            it.save()
        }
        render 0
    }

    def saveGiftInformation() {
        def giftInformation
        if (params.id) {
            giftInformation = GiftInformation.get(params.id)
            giftInformation.properties = params
        } else
            giftInformation = new GiftInformation(params)
        giftInformation.cultureEvents = request.getParameterValues('cultureEvents').collect { CultureEvent.findById(it.toLong()) }
        giftInformation.save()
        redirect(action: "details", id: giftInformation.productType?.id)
    }

    def getChildProductTypesIdList(){
        def productType = ProductType.get(params.id)
        render (getChildProductTypes(productType).collect{it.id}.join(','))
    }

}
