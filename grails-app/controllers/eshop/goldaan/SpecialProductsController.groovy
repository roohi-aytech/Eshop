package eshop.goldaan

import eshop.RoleHelper
import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

@Secured(RoleHelper.ROLE_PRODUCT_TYPE_ADMIN)
class SpecialProductsController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form(){
        def specialProductsInstance
        if(params.id)
            specialProductsInstance = SpecialProducts.get(params.id)
        else
            specialProductsInstance = new SpecialProducts()
        render(template: "form", model: [specialProductsInstance: specialProductsInstance])
    }

    def list() {
    }

    def save() {
        def specialProductsInstance
        if(params.id){
            specialProductsInstance = SpecialProducts.get(params.id)
            specialProductsInstance.properties = params
        }
        else
            specialProductsInstance = new SpecialProducts(params)
        if(specialProductsInstance.validate() && specialProductsInstance.save()){
            render specialProductsInstance as JSON
        }
        else
            render(template: "form", model: [specialProductsInstance: specialProductsInstance])
    }


    def delete() {
        def specialProductsInstance = SpecialProducts.get(params.id)
        specialProductsInstance.delete(flush: true)
        render 0
    }
}
