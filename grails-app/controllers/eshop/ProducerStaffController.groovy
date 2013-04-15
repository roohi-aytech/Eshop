package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON
import grails.plugins.springsecurity.Secured

@Secured(RoleHelper.ROLE_PRODUCT_TYPE_ADMIN)
class ProducerStaffController{
    def form() {
        def producerStaff
        if (params.id)
            producerStaff = ProducerStaff.findById(params.id)
        else
            producerStaff = new ProducerStaff()

        render(template: "/producerStaff/form", model: [producerStaffInstance: producerStaff])
    }

    def list() {

    }

    def index() {
        redirect(action: "list")
    }

    def show(){

    }

}
