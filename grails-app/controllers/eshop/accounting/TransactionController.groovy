package eshop.accounting

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class TransactionController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form(){
        def transactionInstance
        if(params.id)
            transactionInstance = Transaction.get(params.id)
        else
            transactionInstance = new Transaction()
        render(template: "form", model: [transactionInstance: transactionInstance])
    }

    def list() {
    }

    def save() {
        def transactionInstance
        if(params.id){
            transactionInstance = Transaction.get(params.id)
            transactionInstance.properties = params
        }
        else
            transactionInstance = new Transaction(params)
        if(transactionInstance.validate() && transactionInstance.save()){
            render transactionInstance as JSON
        }
        else
            render(template: "form", model: [transactionInstance: transactionInstance])
    }


    def delete() {
        def transactionInstance = Transaction.get(params.id)
        transactionInstance.delete(flush: true)
        render 0
    }
}
