package eshop

import grails.converters.JSON
import grails.plugins.springsecurity.Secured

@Secured(RoleHelper.ROLE_PRODUCT_TYPE_ADMIN)
class StaffRoleController {
    def form() {
        def staffRole
        if (params.id)
            staffRole = StaffRole.findById(params.id)
        else
            staffRole = new StaffRole()

        render(template: "/staffRole/form", model: [staffRoleInstance: staffRole])
    }

    def save() {
        def staffRole
        if (params.id) {
            staffRole = StaffRole.get(params.id)
            staffRole.properties = params
        }
        else
            staffRole = new StaffRole(params)

        if (staffRole.validate()) {
            staffRole.save(flush: true)

            render staffRole as JSON
        }
        else {
            render(template: "/staffRole/form", model: [staffRoleInstance: staffRole])
        }
    }

    def delete() {
        def staffRole = StaffRole.get(params.id)
        if (staffRole)
            staffRole.delete()
        render 0
    }

    def list() {

    }

    def index() {
        redirect(action: "list")
    }

}
