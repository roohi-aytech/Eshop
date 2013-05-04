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

    def save() {
        def productModelInstance
        if (params.id) {
            productModelInstance = ProductModel.get(params.id)
            productModelInstance.properties = params

        }
        else {
            productModelInstance = new ProductModel(params)
        }

            productModelInstance.variationValues = []
            def variations = Variation.findAllByBaseProduct(Product.get(params.product.id))

            variations.each {
                productModelInstance.variationValues.add(VariationValue.get(params."variation_${it.id}"))
            }


        if (productModelInstance.validate() && productModelInstance.save()) {
            render productModelInstance as JSON
        } else
            render(template: "form", model: [productModelInstance: productModelInstance])
    }


    def delete() {
        def productModelInstance = ProductModel.get(params.id)

        productModelInstance.delete(flush: true)
        render 0
    }
}
