package eshop.accounting

import eshop.Brand
import eshop.Product
import eshop.ProductType
import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class AccountFilterController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def accountFilterInstance
        if (params.id)
            accountFilterInstance = AccountFilter.get(params.id)
        else{
            accountFilterInstance = new AccountFilter()
            accountFilterInstance.productType = ProductType.get(params["productType.id"])
        }

        def brands = getBrands(accountFilterInstance.productType)?.findAll{it}

        render(template: "form", model: [accountFilterInstance: accountFilterInstance, brands: brands])
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
        def accountFilterInstance
        if (params.id) {
            accountFilterInstance = AccountFilter.get(params.id)
            accountFilterInstance.properties = params
        } else
            accountFilterInstance = new AccountFilter(params)

        accountFilterInstance.brands?.clear()
        Brand.findAllByIdInList((params.brands instanceof String ? [params.brands] : params.brands).collect { it.toLong() }.toList()).each {
            accountFilterInstance.addToBrands(it)
        }

        if (accountFilterInstance.validate() && accountFilterInstance.save()) {
            render accountFilterInstance as JSON
        } else
            render(template: "form", model: [accountFilterInstance: accountFilterInstance])
    }


    def delete() {
        def accountFilterInstance = AccountFilter.get(params.id)
        accountFilterInstance.delete(flush: true)
        render 0
    }
}
