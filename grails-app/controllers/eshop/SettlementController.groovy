package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON
import grails.plugins.springsecurity.Secured

@Secured(RoleHelper.ROLE_PRODUCT_TYPE_ADMIN)
class SettlementController {
    def form() {
        def settlement
        if (params.id)
            settlement = Settlement.findById(params.id)
        else
            settlement = new Settlement()

        render(template: "/settlement/form", model: [settlementInstance: settlement])
    }

    def save() {
        def settlement
        if (params.id) {
            settlement = Settlement.get(params.id)
            settlement.properties = params

        }
        else
            settlement = new Settlement(params)
        if (settlement.validate()) {
            settlement.save(flush: true)
            render settlement as JSON
        }
        else {
            render(template: "/settlement/form", model: [settlementInstance: settlement])
        }
    }

    def delete() {
        def settlement = Settlement.get(params.id)
        if (settlement)
            settlement.delete()
        render 0
    }

    def list() {

    }

    def index() {
        redirect(action: "list")
    }


}
