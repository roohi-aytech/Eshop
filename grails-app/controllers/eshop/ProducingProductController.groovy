package eshop

import eshop.Producer
import eshop.ProducingProduct
import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class ProducingProductController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }


    def form(){
        def producingProductInstance
        if(params.id)
            producingProductInstance = ProducingProduct.get(params.id)
        else
            producingProductInstance = new ProducingProduct()

        render(template: "form", model: [producingProductInstance: producingProductInstance, producerId: params.producerId])
    }

    def list() {
    }

    def save() {
        def producingProductInstance
        if(params.id){
            producingProductInstance = ProducingProduct.get(params.id)
            producingProductInstance.productTypes = []
            producingProductInstance.brand = null
            producingProductInstance.guarantee = null
            producingProductInstance.settlement = null

            producingProductInstance.properties = params
        }
        else
            producingProductInstance = new ProducingProduct(params)

        if(producingProductInstance.validate() && producingProductInstance.save()){
            render producingProductInstance as JSON
        }
        else
            render(template: "form", model: [producerInstance: producingProductInstance])
    }



    def loadGuarantee(){
        def producingProductInstance
        def brand
        List<ProductType> producerProductTypes = []

        if (params.brand)
            brand = Brand.get(params.brand)
        else
            brand = null

        if (params.productTypes){
            params.productTypes.each{
                producerProductTypes.add(it.toLong())
            }
        }
        else
            producerProductTypes = null

            if (params.producingProductInstance)
                producingProductInstance = ProducingProduct.get(params.producingProductInstance)
            else
                producingProductInstance = new ProducingProduct()

            def guarantees = f(producerProductTypes, brand)

            render(template: "guarantee_value", model: [producingProductInstance: producingProductInstance, guarantees: guarantees])

        render ''
    }

    def f(producerProductTypes, brand){
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

            for (productType in producerProductTypes) {
                def tmp = false
                for (productTypeBrand in it.productTypeBrands) {
                    if (productTypeBrand.productTypes.id.contains(productType) && (productTypeBrand.brand == null || productTypeBrand.brand == brand)){
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

    def deleteProducingProduct() {
        def producingProductInstance = ProducingProduct.get(params.id)

        if(producingProductInstance.productTypes ){
            producingProductInstance.productTypes = null
            producingProductInstance.save()
        }

        producingProductInstance.delete(flush: true)
        render 0
    }
}
