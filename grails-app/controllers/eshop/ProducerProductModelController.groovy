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
                productTypes{
                    eq('id', productModel?.product?.productTypes?.toArray().first()?.id)
                }
            }
        }

        render(template: "form", model: [producerProductModelInstance: producerProductModelInstance, productModel: productModel, producers: producers])
    }

    def producingProduct() {
        def producer = Producer.get(params.producer)
        def p = []
        def producerProductModelInstance = ProducerProductModel.get(params.ProducerProductModelId)
        def productModel = producerProductModelInstance.productModel
        if (producer) {
            p = ProducingProduct.createCriteria().list {
                eq('producer', producer.id)
                eq('guarantee', productModel.guarantee)
                eq('brand', productModel.product.brand)
                productTypes {
                    'in'('id', productModel.product.productTypes)
                }
            }

            render(template: "producingProduct_values", model: [producerProductModelInstance: producerProductModelInstance, producingProduct: p[0]])
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
