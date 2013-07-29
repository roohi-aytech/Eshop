package eshop

import grails.converters.JSON

class ProductModelController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def productModelInstance
        def product = new Product()

        if (params.id)
            productModelInstance = ProductModel.get(params.id)
        else
            productModelInstance = new ProductModel(params)

        if (params.product.id)
            product = Product.get(params.product.id)

        def guarantees = findGuarantees(product?.productTypes, product?.brand)


//        def guarantees = Guarantee.createCriteria().list {
//            productTypeBrands {
//                or {
//                    eq('brand', product?.brand)
//                    isNull('brand')
//                }
//                productTypes {
//                    eq('id', product?.productTypes?.toArray().first()?.id)
//                }
//            }
//        }


        render(template: "form", model: [productModelInstance: productModelInstance, product: product, guarantees: guarantees])
    }

    def findGuarantees(productTypes, brand){
        List<Guarantee> guarantees = []

        def selectedGuarantees = Guarantee.createCriteria().list {
            productTypeBrands {
                or {
                    eq('brand', brand)
                    isNull('brand')
                }
            }
        }
        selectedGuarantees.each {
            it.productTypeBrands.each { productTypeBrand ->
                if (productTypeBrand.productTypes.size() == 0 && !guarantees.contains(it))
                    guarantees.add(it)
            }
        }

        selectedGuarantees.each {
            def temp = -1

            for (productType in productTypes) {
                def tmp = false
                for (productTypeBrand in it.productTypeBrands) {
                    if (productTypeBrand.productTypes.contains(productType) && (productTypeBrand.brand == null || productTypeBrand.brand == brand)){
                        tmp = true
                        if(temp == -1) temp = 1
                        break
                    }
                }
                if (tmp == false){
                    temp = 0
                }
            }

            if (temp == 1 && !guarantees.contains(it))
                guarantees.add(it)
        }

        return guarantees
    }


    def list() {
        [pmid: params.pmid ?: 0]

    }

    def validate(ProductModel productModel){
        boolean tmp
        def lastProductModel
        def allLastProductModels = ProductModel.findAllByProductAndGuarantee(productModel.product, productModel.guarantee)
        allLastProductModels.each {
            tmp = true
            it.variationValues.each {
                if(!productModel.variationValues.collect{it.id}.contains(it.id)){
                    tmp = false
                }
            }
            if (tmp == true){
                lastProductModel = it
            }
        }
        if (lastProductModel)
            return false
        else
            return true
    }

    def save() {
        def modelInstance
        if (params.id) {
            modelInstance = ProductModel.get(params.id)
            modelInstance.properties = params
            modelInstance.variationValues = []
            def variations = Variation.findAllByBaseProduct(Product.get(params.product.id))

            variations.each {
                modelInstance.variationValues.add(VariationValue.get(params."variation_${it.id}"))
            }
        }
        else {
            modelInstance = new ProductModel(params)

            modelInstance.variationValues = []
            def variations = Variation.findAllByBaseProduct(Product.get(params.product.id))

            variations.each {
                modelInstance.variationValues.add(VariationValue.get(params."variation_${it.id}"))
            }

            if (!modelInstance.guarantee) {
                flash.message = message(code: "default.enter_guarantee")
                render(template: 'form', model: ['productModelInstance': modelInstance, 'product' : Product.get(params.product.id)])

                return
            }

            if (!validate(modelInstance)) {
                flash.message = message(code: "default.repetitive")
                render(template: 'form', model: ['productModelInstance': modelInstance, 'product' : Product.get(params.product.id)])

                return
            }
        }

        def productModelDefault = ProductModel.findByProductAndIsDefaultModel(modelInstance.product, true)
        
        if(modelInstance.getIsDefaultModel()){
           if (productModelDefault && productModelDefault.id != modelInstance.id){
               productModelDefault.isDefaultModel = false
           }
        }
       //this is the first model of this group
        else if(productModelDefault == null)
            modelInstance.isDefaultModel = true

        if (modelInstance.validate() && modelInstance.save()) {
            render modelInstance as JSON
        } else
            render(template: "form", model: [modelInstance: modelInstance])
    }


    def delete() {
        def productModelInstance = ProductModel.get(params.id)
        if (productModelInstance.isDefaultModel){
            def tempModel = ProductModel.findAllByProduct(productModelInstance.product)
            tempModel[0].isDefaultModel = true
            tempModel[0].save()
        }
        if(productModelInstance.variationValues)
            productModelInstance.variationValues = null

        productModelInstance.save()

        ProducerProductModel.list().findAll{it -> it.productModelId == productModelInstance.id}.each {it.delete(flush: true)}

        productModelInstance.delete(flush: true)
        render 0
    }

    def details(){
        def productModelInstance = ProductModel.get(params.id)
        def product = productModelInstance.product

        [productModelInstance : productModelInstance, product: product]
    }

    def producersDetails(){
        def productModelInstance = ProductModel.get(params.id)

        [productModelInstance : productModelInstance]
    }

    def productModelDetails(){
        def productModelInstance = ProductModel.get(params.id)

        [productModelInstance : productModelInstance]
    }



    def priceHistogram(){
        def productModel = ProductModel.get(params.id)
        render template: 'priceHistogram', model: [productModel: productModel, priceList: Price.findAllByProductModel(productModel).sort{it.startDate}]
    }

}
