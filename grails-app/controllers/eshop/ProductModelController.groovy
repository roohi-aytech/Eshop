package eshop

import grails.converters.JSON

class ProductModelController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def productModelInstance
        def product

        if (params.id)
            productModelInstance = ProductModel.get(params.id)
        else
            productModelInstance = new ProductModel(params)

        if (params.product.id)
            product = Product.get(params.product.id)

        render(template: "form", model: [productModelInstance: productModelInstance, product: product])
    }

    def list() {
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

            if (!validate(modelInstance)) {
                flash.message = message(code: 'default.repetitive', args: [message(code: 'productModel.label', default: 'Product Model'), params.id])
                redirect(action: "list")
                return

            }
        }

        def productModelDefault = ProductModel.findByProductAndIsDefaultModel(modelInstance.product, true)
        
        if(modelInstance.getIsDefaultModel()){
           if (productModelDefault){
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

        productModelInstance.delete(flush: true)
        render 0
    }

    def details(){
        def productModelInstance = ProductModel.get(params.id)

        [productModelInstance : productModelInstance]
    }

    def priceDetail(){
        }

    def producerDetail(){

    }
}
