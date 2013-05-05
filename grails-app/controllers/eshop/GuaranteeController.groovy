package eshop

import eshop.Producer
import eshop.ProducingProduct
import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class GuaranteeController {

//    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form(){
        def guaranteeInstance
        if(params.id)
            guaranteeInstance = Guarantee.get(params.id)
        else
            guaranteeInstance = new Guarantee()

        render(template: "form", model: [guaranteeInstance: guaranteeInstance])
    }

    def list() {

    }

    def save() {
        def guarantee
        if (params.id) {
            guarantee = Guarantee.get(params.id)
            def logo = guarantee.logo
            guarantee.properties = params
            if (!guarantee.logo)
                guarantee.logo = logo
        }
        else
            guarantee = new Guarantee(params)
        if (guarantee.validate()) {
            guarantee.save(flush: true)
            render guarantee as JSON
        }
        else {
            render(template: "/guarantee/form", model: [guaranteeInstance: guarantee])
        }
    }

    def delete() {
        def guaranteeInstance = Guarantee.get(params.id)
        guaranteeInstance.delete(flush: true)
        render 0
    }

    def getLogo() {
        def guarantee = Guarantee.get(params.id)
        if (guarantee && guarantee.logo) {
            response.addHeader("content-disposition", "attachment;filename=$guarantee.name")
//        response.contentType = "image/jpeg"
            response.contentLength = guarantee.logo.length
            response.outputStream << guarantee.logo
        }
        else {
            response.contentLength = 0
            response.outputStream << []
        }

    }
}
