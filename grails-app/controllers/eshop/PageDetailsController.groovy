package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class PageDetailsController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def pageDetailsInstance
        if (params.id)
            pageDetailsInstance = PageDetails.get(params.id)
        else
            pageDetailsInstance = new PageDetails()
        render(template: "form", model: [pageDetailsInstance: pageDetailsInstance])
    }

    def list() {
    }

    def save() {
        def pageDetailsInstance
        if (params.id) {
            pageDetailsInstance = PageDetails.get(params.id)
            if (pageDetailsInstance.brand && !params.brand.id || pageDetailsInstance.productType && !params.productType.id)
            {
                pageDetailsInstance.delete()
                pageDetailsInstance=new PageDetails(params)
            }else
                pageDetailsInstance.properties = params
        }
        else
            pageDetailsInstance = new PageDetails(params)
        if (pageDetailsInstance.validate() && pageDetailsInstance.save()) {
            render pageDetailsInstance as JSON
        }
        else
            render(template: "form", model: [pageDetailsInstance: pageDetailsInstance])
    }


    def delete() {
        def pageDetailsInstance = PageDetails.get(params.id)
        pageDetailsInstance.delete(flush: true)
        render 0
    }
}
