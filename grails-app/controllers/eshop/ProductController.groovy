package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

import grails.plugins.springsecurity.Secured
import org.springframework.http.HttpStatus
import eshop.mongo.MongoProduct

@Secured([RoleHelper.ROLE_PRODUCT_ADMIN, RoleHelper.ROLE_PRODUCT_ADD, RoleHelper.ROLE_PRODUCT_ADD_EDIT])
class ProductController {

    def imageService
    def fileService
    def productService
    def mongoService
//    def dataSource

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        [ptid: params.ptid ?: 0]
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
        def productTypeTypes = []
        productInstance.productTypes.each {
            productTypeIds << it.id
            productTypeTypes.addAll(it.types)
        }


        render(template: "form", model: [productInstance: productInstance, productTypeIds: productTypeIds.join(","), productTypeTypes: productTypeTypes])
    }

    def typeForm() {
        def productTypeType
        if (params.id)
            productTypeType = ProductTypeType.get(params.id)
        else
            productTypeType = new ProductTypeType()
        render(template: "typeValue", model: [productTypeType: productTypeType])
    }

    def getTypeImage() {
        def content = ProductTypeType.get(params.id).image
        response.contentType = 'image/png'
        response.outputStream << content
        response.outputStream.flush()
    }

    def deleteType() {
        try {
            def type = ProductTypeType.get(params.id)
            if (type) {
                Product.findAllByType(type).each {
                    it.type = null
                    it.save()
                }
                def productType = ProductType.get(params.ptid)
                productType?.removeFromTypes(type)
                productType?.save()
                type.delete()
                render 0
            }
        } catch (e) {
            render e
        }
    }

    def saveType() {
        def productTypeType
        if (params.id) {
            productTypeType = ProductTypeType.get(params.id)
            productTypeType.properties = params
        }
        else
            productTypeType = new ProductTypeType(params)
        def image = productTypeType.image
        productTypeType.image = null
        productTypeType = productTypeType.save()
        if (image) {
            productTypeType.image = imageService.saveAndScaleImages(image, "image", fileService.filePath(productTypeType))
            productTypeType.save()
        }
        if (params.productInstanceId) {
            def productInstance = Product.get(params.productInstanceId)
            productInstance.productTypes.each {
                it.addToTypes(productTypeType)
                it.save()
            }
        }
        Product.findAllByType(productTypeType).each {
            mongoService.storeProduct(it)
        }
        render productTypeType as JSON
    }

    def attrValueForm() {
        def attr = AttributeType.get(params.attributeTypeId)
        def attributeValue
        if (params.id)
            attributeValue = AttributeValue.get(params.id)
        else
            attributeValue = new AttributeValue()

        render(template: "attrValue", model: [attributeTypeId: params.attributeTypeId, attributeType: attr?.attributeType, attributeValue: attributeValue])
    }

    def saveAttributeValue() {

        def attributeValue
        if (params.id) {
            attributeValue = AttributeValue.get(params.id)
            attributeValue.properties = params
            attributeValue.save()
        }
        else {
            def attributeType = AttributeType.get(params.attributeTypeId)
            attributeValue = new AttributeValue(params).save()
            attributeType.addToValues(attributeValue)
            attributeType.save()
        }
        render(attributeValue as JSON)
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
        def productTypeTypes = []

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
                productTypeTypes.addAll(it.types)
            }
        }
        else {
            productInstance = new Product()
        }

        [productInstance: productInstance, productTypeIds: productTypeIds.join(","), baseProductInstance: productInstance, curtab: params.curtab, curtab2: params.curtab2, ptid: params.ptid ?: productInstance?.productTypes?.find()?.id, productTypeTypes: productTypeTypes]
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
        if (params.type?.id) {
            def type = ProductTypeType.get(params.type.id)
            productInstance.type = type
            productInstance.save()
        }
        Attribute.withTransaction {
            attributeTypes.each { AttributeType attributeType ->
                def attribute = productInstance.attributes.find { it.attributeType.id == attributeType.id }
                if (!attribute)
                    attribute = new Attribute(attributeType: attributeType, product: productInstance)
                if (params."notAvailable_${attributeType.id}")
                    attribute.value = AttributeValue.findByValue('N/A') ?: new AttributeValue(value: "N/A").save()
                else
                    attribute.value = AttributeValue.get(params."at_${attributeType.id}")
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

    def editImageDetailsAndExit() {
        def product = Product.get(params.product.id)
        def defaultImage = Content.get(params.mainImage)
        if (defaultImage) {
            product.mainImage = defaultImage
            product.save()
        }
        redirect(action: "list", params: [curtab: params.curtab, curtab2: params.curtab2])
    }


    def relatedProductForm() {
        def relatedProduct
        if (params.id)
            relatedProduct = RelatedProduct.findById(params.id)
        else
            relatedProduct = new RelatedProduct()

        render(template: "relatedProduct_form", model: [relatedProductInstance: relatedProduct, baseProductId: params.baseProductId])
    }

    def saveRelatedProduct() {
        RelatedProduct relatedProduct
        if (params.id) {
            relatedProduct = RelatedProduct.get(params.id)
            relatedProduct.properties = params
        }
        else
            relatedProduct = new RelatedProduct(params)

        // variation.variationValues = request.getParameterValues('variationValues').collect {VariationValue.findById(it.toLong())}
        relatedProduct.save()

        render 0
    }

    def AccessoryForm() {
        def accessory
        if (params.id)
            accessory = Accessory.findById(params.id)
        else
            accessory = new Accessory()

        render(template: "accessories_form", model: [accessoryInstance: accessory, baseProductId: params.baseProductId])

    }

    def saveAccessory() {

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

    def video() {
        render 0
    }

    def deleteimage() {
        def success = productService.deleteProductImage(params.id, params.name)
        def result = [success: success]
        render result as JSON
    }

    def deletevideo() {
        def success = productService.deleteProductVideo(params.id, params.name)
        def result = [success: success]
        render result as JSON
    }

    def uploadImage() {
        upload("image")
    }

    def uploadVideo() {
        upload("video")
    }

    private def upload(contentType) {

        switch (request.method) {
            case "GET":
                def product = Product.get(params.id)
                def results = []
                product[contentType + "s"].each {

                    results << [
                            name: it.name,
                            size: it.fileContent.length,
//                            url: createLink( action:'image', pa: params.id),
                            thumbnail_url: contentType == "image" ? createLink(action: contentType, params: [id: params.id, name: it.name]) : resource(dir: 'images', file: 'video.png'),
                            delete_url: createLink(action: "delete${contentType}", params: [id: params.id, name: it.name]),
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
                    if (contentType == "image")
                        bytes = imageService.saveAndScaleImages(bytes, file.originalFilename, fileService.filePath(Product.get(params.id)))
                    else if (contentType == "video") {
                        fileService.saveFile(bytes, file.originalFilename, "video", fileService.filePath(Product.get(params.id)))
                        bytes = [0]
                    }
                    def content = new Content(contentType: contentType, name: file.originalFilename, fileContent: bytes)
                    content.save()
                    images << content
                    result << [name: file.originalFilename,
                            size: file.size,
                            thumbnail_url: contentType == "image" ? createLink(action: 'image', params: [id: params.id, name: file.originalFilename]) : resource(dir: 'images', file: 'video.png'),
                            delete_url: createLink(action: "delete${contentType}", params: [id: params.id, name: file.originalFilename]),
                            delete_type: "GET"]
                }
                if (contentType == "image")
                    productService.addImageToProduct(params.id, images)
                else if (contentType == "video")
                    productService.addVideoToProduct(params.id, images)
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
        redirect(action: "productDetails", params: [curtab: params.curtab, pid: res.productInstance?.id, ptid: params.ptid])

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
            try {
                mongoService.storeProduct(it)
                println it
            } catch (e) {
                println(e)
            }
        }
        render "Synch OK"
    }

    def findDuplicates() {
        Product.findAll().each { mp ->
            def ps = Product.findAllByNameLikeAndNameNotEqual("%${mp.name}%", mp.name)
            ps.each {
                render " ${it} -------> ${mp} ____________________  ${it.id} -------> ${mp.id}"
                render "<br>"
            }
        }
        render "OK"
    }

    def searchCountryValues() {
        def res = Product.executeQuery("select distinct manufactureCountry from Product where manufactureCountry like ? ", ["%${params.term}%"])
        render res.collect {[id: it, label: it, value: it]} as JSON
    }

    def countryForm() {
        render(template: "countryForm", model: [country: params.country])
    }

    def saveCountry() {
        if (params.manufactureCountry) {
            Product.findAllByManufactureCountry(params.manufactureCountryOld).each {
                it.manufactureCountry = params.manufactureCountry
                it.save()
            }
            render ([country:params.manufactureCountry] as JSON)
        }
        else {
            render(template: "countryForm", model: [country: params.manufactureCountryOld, hasError: true])
        }
    }

    def variationValues(Variation variation) {

        return variation.variationValues

    }
}
