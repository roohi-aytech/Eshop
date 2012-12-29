package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON
import grails.plugins.springsecurity.Secured

@Secured(RoleHelper.ROLE_PRODUCT_TYPE_ADMIN)
class ProductTypeController {
    def imageService

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
        }
        else
            attributeCategory = new AttributeCategory(params)
        if (attributeCategory.validate() && attributeCategory.save()) {
            render attributeCategory as JSON
        }
        else {
            render(template: "form_AttributeCategory", model: [attributeCategory: attributeCategory])
        }
    }

    def deleteAttributeCategory() {
        try {

            def attributecategory = AttributeCategory.get(params.id)
            AttributeType.findAllByCategory(attributecategory).each {
                it.category = null
                it.save()
            }
            attributecategory.delete()
            render 0
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
        if (productTypeInstance.products.size() > 0) {
            render(message(code: "producttype.contains.products"))
            return
        }
        if (productTypeInstance.children.size() > 0) {
            render(message(code: "producttype.contains.children"))
            return
        }
        try {
//            if (productTypeInstance.rootProductType == productTypeInstance){
//                productTypeInstance.rootProductType = null
//                productTypeInstance.save(flush: true)
//            }
            productTypeInstance.products.each {
                it.removeFromProductTypes(productTypeInstance)
                it.save()
            }
            productTypeInstance.delete(flush: true)
            render 0;
        }
        catch (DataIntegrityViolationException e) {
            render 1;
        }
    }

    def deleteAttributeType() {
        def attributeTypeInstance = AttributeType.get(params.id)
        if (!attributeTypeInstance) {
            render 1;
            return
        }

        try {
            attributeTypeInstance.attributes.each {it.delete()}
            attributeTypeInstance.delete(flush: true)
            render 0;
        }
        catch (DataIntegrityViolationException e) {
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
        try {
            def productType
            if (params.id) {
                productType = ProductType.get(params.id)
                productType.properties = params
            }
            else
                productType = new ProductType(params)
            def image = productType.image
            productType.image = null

            productType.rootProductType = productType.parentProduct ? productType.parentProduct.rootProductType : productType
            productType = productType.save()
            if (image) {
                productType.image = imageService.saveAndScaleImages(image, "image", "pt${productType.id}")
                productType.save()
            }
            render 0;
        }
        catch (x) {
            render 1;
        }
    }

    def getImage() {
        def productType = ProductType.get(params.id)
        if (productType && productType.image) {
            response.addHeader("content-disposition", "attachment;filename=$productType.name")
            response.contentLength = productType.image.length
            response.outputStream << productType.image
        }
        else {
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
            }
            else
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


    def attributeForm() {
        def attribute
        if (params.id)
            attribute = AttributeType.get(params.id)
        else {
            attribute = new AttributeType(params)
        }
        def attributeCategories = AttributeCategory.findAllByProductType(attribute.productType)
        render(template: "form_Attribute", model: [attributeTypeInstance: attribute, attributeCategories: attributeCategories])
    }

    def saveAttribute() {
        def attribute;
        if (params.id) {
            attribute = Attribute.get(params.id)
            attribute.properties = params;
        }
        else
            attribute = new Attribute(params);
        attribute.save()
    }

    def saveAttributeType() {
        def attributeType;
        if (params.id) {
            attributeType = AttributeType.get(params.id)
            attributeType.properties = params;
        }
        else
            attributeType = new AttributeType(params);
        if (params.values_old && attributeType.id) {
            params.values_old.eachWithIndex {oldVal, idx ->
                def attributes = Attribute.findAllByAttributeTypeAndAttributeValue(attributeType, oldVal)
                attributes.each {
                    it.attributeValue = params.values[idx]
                    it.save()
                }
            }
        }

        attributeType.save()
        render "0"
    }

    def getAttributeTypeValues() {
        def attributeType = AttributeType.get(params.id)
        render attributeType.values as JSON

    }

    def getProductTypes() {
        def json = []

        ProductType.findAllByParentProductIsNull().each {
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
            productType.children.each {
                json.children << fillJson(it, curId)
            }
        }
        json
    }

    def moveProductType() {
        def productType = ProductType.get(params.id)
        productType.parentProduct = ProductType.get(params.parentId)
        productType.save()
        render 0
    }

    def details() {
        def productTypeInstance = ProductType.get(params.id)
        [productTypeInstance: productTypeInstance, baseProductInstance: productTypeInstance]
    }

    def saveGodFathers() {
        def productType = ProductType.get(params.id)
        params.godFathers.split(",").each {
            if (it) {
                productType.addToGodFathers(ProductType.get(it))
            }
        }
        productType.save()
        render(view: "details", model: [productTypeInstance: productType, baseProductInstance: productType])
    }
}
