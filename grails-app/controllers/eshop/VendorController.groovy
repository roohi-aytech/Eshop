package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class VendorController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def vendorInstance
        if (params.id)
            vendorInstance = Vendor.get(params.id)
        else {
            vendorInstance = new Vendor()
            vendorInstance.productType = ProductType.get(params["productType.id"])
        }

        def brands = getBrands(vendorInstance.productType)?.findAll{it}


        render(template: "form", model: [vendorInstance: vendorInstance, brands: brands])
    }

    List<Brand> getBrands(ProductType productType){
        def brands = Product.createCriteria().list {
            productTypes {
                eq('id', productType.id)
            }
        }.collect {it.brand}

        productType.children?.each {
            brands.addAll(getBrands(it))
        }

        brands.unique {it?.id}
    }

    def list() {
    }

    def save() {
        def vendorInstance
        if (params.id) {
            vendorInstance = Vendor.get(params.id)
            vendorInstance.properties = params
        } else
            vendorInstance = new Vendor(params)

        vendorInstance.brands?.clear()
        Brand.findAllByIdInList((params.brands instanceof String ? [params.brands] : params.brands).collect { it.toLong() }.toList()).each {
            vendorInstance.addToBrands(it)
        }

        if (vendorInstance.validate() && vendorInstance.save()) {
            render vendorInstance as JSON
        } else
            render(template: "form", model: [vendorInstance: vendorInstance])
    }

    def delete() {
        def vendorInstance = Vendor.get(params.id)
        vendorInstance.deleted = true
        vendorInstance.save()

        render 0
    }
}
