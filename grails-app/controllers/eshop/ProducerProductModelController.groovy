package eshop

import grails.converters.JSON

class ProducerProductModelController {
    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def producerProductModelInstance
        def productModel = new ProductModel()

        if (params.id)
            producerProductModelInstance = ProducerProductModel.get(params.id)
        else
            producerProductModelInstance = new ProducerProductModel(params)

        if (params.productModel.id)
            productModel = ProductModel.get(params.productModel.id)


        def producers = Producer.createCriteria().list {
            producingProducts {
                or {
                    eq('guarantee', productModel?.guarantee)
                    isNull('guarantee')
                }
                or {
                    eq('brand', productModel?.product?.brand)
                    isNull('brand')
                }
                productTypes {
                    eq('id', productModel?.product?.productTypes?.toArray().first()?.id)
                }
            }
        }
        Producer producer = new Producer()

        render(template: "form", model: [producerProductModelInstance: producerProductModelInstance, productModel: productModel, producers: producers, producer: producer])
    }

    def producingProduct() {
        def producingProduct
        def producer = Producer.get(params.producer)
        def p = []
        def producerProductModelInstance
        def productModel

        if (params.ProducerProductModelId)
            producerProductModelInstance = ProducerProductModel.get(params.ProducerProductModelId)
        else
            producerProductModelInstance = new ProducerProductModel()

        if(params.productModelId)
            productModel = ProductModel.get(params.productModelId)
        else
            productModel = new ProductModel()

        if (producer) {
            p = ProducingProduct.createCriteria().list {
                eq('producer', producer)
                or {
                    eq('guarantee', productModel?.guarantee)
                    isNull('guarantee')
                }
                or {
                    eq('brand', productModel?.product?.brand)
                    isNull('brand')
                }
                productTypes {
                    eq('id', productModel?.product?.productTypes?.toArray()?.first()?.id)
                }
            }
            if (p.size() > 0) {
                producingProduct = p[0]
                producerProductModelInstance.properties = producingProduct.properties
            }

            render(template: "producingProduct_values", model: [producerProductModelInstance: producerProductModelInstance])
        } else
            render ""
    }

    def list() {
    }

    def save() {
        def producerProductModelInstance
        if (params.id) {
            producerProductModelInstance = ProducerProductModel.get(params.id)
            producerProductModelInstance.properties = params
        } else {
            producerProductModelInstance = new ProducerProductModel(params)
        }

        if (producerProductModelInstance.validate() && producerProductModelInstance.save()) {
            render producerProductModelInstance as JSON
        } else
            render(template: "form", model: [producerProductModelInstance: producerProductModelInstance])
    }

    def delete() {
        def producerProductModelInstance = ProducerProductModel.get(params.id)

        producerProductModelInstance.delete(flush: true)
        render 0
    }

}
