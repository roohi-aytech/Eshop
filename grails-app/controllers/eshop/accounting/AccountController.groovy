package eshop.accounting

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class AccountController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def accountInstance
        if (params.id)
            accountInstance = Account.get(params.id)
        else
            accountInstance = new Account()
        render(template: "form", model: [accountInstance: accountInstance])
    }

    def list() {
    }

    def save() {
        def accountInstance
        if (params.id) {
            accountInstance = Account.get(params.id)
            accountInstance.properties = params
        } else
            accountInstance = new Account(params)
        if (accountInstance.validate() && accountInstance.save()) {
            render accountInstance as JSON
        } else
            render(template: "form", model: [accountInstance: accountInstance])
    }


    def delete() {
        def accountInstance = Account.get(params.id)
        accountInstance.delete(flush: true)
        render 0
    }
}
