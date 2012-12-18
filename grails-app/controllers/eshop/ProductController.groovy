package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

import grails.plugins.springsecurity.Secured
import org.springframework.http.HttpStatus
import eshop.mongo.MongoProduct

@Secured(RoleHelper.ROLE_PRODUCT_ADMIN)
class ProductController {

    def imageService
    def productService
    def mongoService
//    def dataSource

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        [ptid: params.ptid]
    }

    def create() {
        [productInstance: new Product(params)]
    }

    def form() {
        def productInstance
        if (params.id)
            productInstance = Product.findById(params.id)
        else
            productInstance = new Product()
        def productTypeIds = [];
        productInstance.productTypes.each {
            productTypeIds << it.id
        }
        render(template: "form", model: [productInstance: productInstance, productTypeIds: productTypeIds.join(",")])
    }

    def attrValueForm() {
        def attr = AttributeType.get(params.attributeTypeId)
        def vals = attr?.values?.sort()?.toArray()
        render(template: "attrValue", model: [attributeTypeId: params.attributeTypeId, value: params.valueIndex?vals[Integer.parseInt(params.valueIndex)]:'', attributeType: attr?.attributeType])
    }

    def addAttributeValue() {
        def attributeType = AttributeType.get(params.attributeTypeId)
        if (params.values) {
            if (attributeType.values && attributeType.defaultValue)
                attributeType.addToValues(attributeType.defaultValue)
            attributeType.addToValues(params.values)
            attributeType.save()
            render([values: params.values] as JSON)
        }
        else
            render(template: "attrValue", model: [attributeTypeId: params.attributeTypeId])
    }

    def editAttributeValue() {
        def attributeType = AttributeType.get(params.attributeTypeId)
        if (params.values && params.values != params.oldValues) {
            attributeType.removeFromValues(params.oldValues)
            attributeType.addToValues(params.values)
            attributeType = attributeType.save()
            def attributes = Attribute.findAllByAttributeTypeAndAttributeValue(attributeType, params.oldValues)
            attributes.each {
                it.attributeValue = params.values
                it.save()
            }

            render([values: params.values] as JSON)
        }
        else
            render(template: "attrValue", model: [attributeTypeId: params.attributeTypeId, value: params.values])
    }

    def imageVariations() {
        def content = Content.get(params.id)
        def product = Product.get(params.productId)
        render(template: "content/variations_form", model: [content: content, productInstance: product])
    }

    def imageVariation() {
        def baseProductInstance = BaseProduct.get(params.productId)
        def variations = baseProductInstance.variations
        render(template: "content/variation", model: [variations: variations])
    }

    def imageVariationValue() {
        def variation = Variation.get(params.variation)
        if (variation) {
            def values = variation.variationValues
            render(template: "content/variation_values", model: [variationValues: values])
        }
        else
            render ""
    }

    def saveImageVariations() {
        def image = Content.get(params.id)
        if (image) {
            image.properties = params;
            image.save()
            render image.variationValues as JSON
        }
        else
            render 0
    }


    def productDetails() {
        def productInstance
        def productTypeIds = []

        if (params.id) {
            def mongoProduct = MongoProduct.get(params.id)
            productInstance = Product.get(mongoProduct.baseProductId)
        }
        if (params.pid) {
            productInstance = Product.get(params.pid)
        }

        if (productInstance) {
            productInstance.productTypes.each {
                productTypeIds << it.id
            }
        }
        else {
            productInstance = new Product()
        }

        [productInstance: productInstance, productTypeIds: productTypeIds.join(","), baseProductInstance: productInstance, curtab: params.curtab, curtab2: params.curtab2, ptid: params.ptid]
    }

    def saveProductDescription() {
        def productInstance = Product.findById(params.id)
        productInstance.details = params.detail_description;
        productInstance.save()
        redirect(action: "productDetails", params: [pid: params.id, curtab: params.curtab])
    }

    def saveAttributeValues() {
        saveAttributeValuesInternal(params)
        redirect(action: "productDetails", params: [pid: params.id, curtab: params.curtab, ptid: params.ptid])
    }

    def saveAttributeValuesAndExit() {
        saveAttributeValuesInternal(params)
        redirect(action: "list", params: [ptid: params.ptid])
    }

    def saveAttributeValuesAndNew() {
        saveAttributeValuesInternal(params)
        redirect(action: "productDetails", params: [ptid: params.ptid])
    }

    private void saveAttributeValuesInternal(params) {
        def productInstance = Product.findById(params.id)
        def attributeTypes = productInstance?.productTypes.collect {attributeTypes(it)}.flatten()

        Attribute.withTransaction {
            attributeTypes.each { AttributeType attributeType ->
                def attribute = productInstance.attributes.find { it.attributeType.id == attributeType.id }
                if (!attribute)
                    attribute = new Attribute(attributeType: attributeType, product: productInstance)
                attribute.attributeValue = params."at_${attributeType.id}"
                attribute.save()
            }
        }
        mongoService.storeProduct(productInstance)
    }

    def editImageDetails() {
        def product = Product.get(params.product.id)
        def defaultImage = Content.get(params.mainImage)
        if (defaultImage) {
            product.mainImage = defaultImage
            product.save()
        }
        redirect(action: "productDetails", params: [pid: params.product.id, curtab: params.curtab, curtab2: params.curtab2])
    }

    def variationValue() {
        def variation = Variation.get(params.variation)
        if (variation) {
            def values = variation.variationValues
            render(template: "variation_values", model: [variationValues: values])
        }
        else
            render ""
    }

    private def attributeTypes(ProductType productType) {
        def res = productType.attributeTypes.flatten()
        if (productType.parentProduct)
            res << attributeTypes(productType.parentProduct)
        return res
    }

    def image() {
        redirect(controller: "image", action: "index", params: params)
    }

    def deleteImage() {
        def success = productService.deleteProductImage(params.id, params.name)
        def result = [success: success]
        render result as JSON
    }

    def uploadImage() {

        switch (request.method) {
            case "GET":
                def product = Product.get(params.id)
                def results = []
                product.images.each {

                    results << [
                            name: it.name,
                            size: it.fileContent.length,
//                            url: createLink( action:'image', pa: params.id),
                            thumbnail_url: createLink(action: 'image', params: [id: params.id, name: it.name]),
                            delete_url: createLink(action: 'deleteImage', params: [id: params.id, name: it.name]),
                            delete_type: "GET"
                    ]
                }
                render results as JSON
                break;
            case "POST":
                Collection result = []
                def images = new HashSet<Content>()
                request.getFileNames().each {
                    def file = request.getFile(it)
                    def bytes = file.bytes
                    bytes = imageService.saveAndScaleImages(bytes, file.originalFilename, params.id)
                    def content = new Content(contentType: "image", name: file.originalFilename, fileContent: bytes)
                    content.save()
                    images << content
                    result << [name: file.originalFilename,
                            size: file.size,
                            thumbnail_url: createLink(action: 'image', params: [id: params.id, name: file.originalFilename]),
                            delete_url: createLink(action: 'deleteImage', params: [id: params.id, name: file.originalFilename]),
                            delete_type: "GET"]
                }

//                synchronized (this.getClass()) {
                productService.addImageToProduct(params.id, images)

                render result as JSON
                break;
            default: render status: HttpStatus.METHOD_NOT_ALLOWED.value()
        }
    }

    def save() {
        def productInstance
        if (params.id) {
            productInstance = Product.get(params.id)
            productInstance.properties = params
        }
        else
            productInstance = new Product(params)


        def tmp = []
        productInstance.productTypes.each {
            tmp << it
        }
        tmp.each {
            productInstance.removeFromProductTypes(it)
        }
        params.producttypes.split(",").each {
            if (it) {
                def productType = ProductType.get(it)
                productInstance.addToProductTypes(productType);
            }
        }
        if (!productInstance.save(flush: true)) {
            render(view: "create", model: [productInstance: productInstance])
            return
        }

        render productInstance as JSON
    }

    def saveProductAndReturnToDetailsPage() {
        def res = saveProduct(params)
        render(view: "productDetails", model: [productInstance: res.productInstance, productTypeIds: res.productTypeIds.join(","), baseProductInstance: res.productInstance, curtab: params.curtab])

    }

    def saveProductAndExit() {
        saveProduct(params)
        redirect(action: "list", params: [ptid: params.ptid])
    }

    def saveProductAndNew() {
        saveProduct(params)
        redirect(action: "productDetails")
    }

    private def saveProduct(params) {
        def productInstance
        if (params.id) {
            productInstance = Product.get(params.id)
            productInstance.properties = params
        }
        else
            productInstance = new Product(params)
        def tmp = []
        productInstance.productTypes.each {
            tmp << it
        }
        tmp.each {
            productInstance.removeFromProductTypes(it)
        }
        params.producttypes.split(",").each {
            if (it) {
                def productType = ProductType.get(it)
                productInstance.addToProductTypes(productType);
            }
        }
        if (!productInstance.save(flush: true)) {
        }

        def productTypeIds = []
        productInstance.productTypes.each {
            productTypeIds << it.id
        }
//        try{
//            dataSource.getc
//        }catch(x){
//
//        }
        mongoService.storeProduct(productInstance)
        return [productInstance: productInstance, productTypeIds: productTypeIds]
    }

    def show() {
        def productInstance = Product.get(params.id)
        if (!productInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "list")
            return
        }

        [productInstance: productInstance]
    }

    def edit() {
        def productInstance = Product.get(params.id)
        if (!productInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "list")
            return
        }

        [productInstance: productInstance]
    }

    def update() {
        def productInstance = Product.get(params.id)
        if (!productInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (productInstance.version > version) {
                productInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'product.label', default: 'Product')] as Object[],
                        "Another user has updated this Product while you were editing")
                render(view: "edit", model: [productInstance: productInstance])
                return
            }
        }

        productInstance.properties = params

        if (!productInstance.save(flush: true)) {
            render(view: "edit", model: [productInstance: productInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'product.label', default: 'Product'), productInstance.id])
        redirect(action: "show", id: productInstance.id)
    }

    def delete() {

        def mongoProductInstance = MongoProduct.get(params.id)
        if (!mongoProductInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            render 1
        }

        try {
            def tmp = []
            def product = Product.get(mongoProductInstance.baseProductId)
            product.productTypes.each {
                tmp << it
            }
            tmp.each {
                product.removeFromProductTypes(it)
            }
            mongoProductInstance.delete(flush: true)
            product.mainImage?.delete()
            product.images.each {it.delete()}
            product.videos.each {it.delete()}

            product.attributes.each {it.delete()}
            AddedValue.findAllByBaseProduct(product).each {it.delete()}
            Price.findAllByProduct(product).each {it.delete()}

            Variation.findAllByBaseProduct(product).each {it.delete()}
            product.delete()
            render 0;
        }
        catch (DataIntegrityViolationException e) {
            render 1;
        }
    }

    def synchMongo() {
        Product.findAll().each {
            mongoService.storeProduct(it)
            println it
        }
        render "Synch OK"
    }
}
