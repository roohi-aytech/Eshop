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

        render(template: "form", model: [vendorInstance: vendorInstance])
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
        Brand.findAllByIdInList(params.brands.collect { it.toLong() }.toList()).each {
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
