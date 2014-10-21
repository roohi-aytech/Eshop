package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON
import grails.plugins.springsecurity.Secured

@Secured(RoleHelper.ROLE_PRODUCT_TYPE_ADMIN)
class ProducerStaffController{
    def form() {
        def producerStaffInstance
        if (params.id)
            producerStaffInstance = ProducerStaff.findById(params.id)
        else
            producerStaffInstance = new ProducerStaff()

        render(template: "/producerStaff/form", model: [producerStaffInstance: producerStaffInstance])
    }

    def list() {

    }

    def index() {
        redirect(action: "list", params: params)

    }

    def show(){
        def producerStaffInstance = ProducerStaff.get(params.id)
        if (!producerStaffInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'producerStaff.label',
                    default: 'ProducerStaff'), id])
            redirect(action: "list")
            return
        }

        [producerStaffInstance: producerStaffInstance]
    }

}
