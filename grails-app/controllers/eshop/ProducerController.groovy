package eshop

import grails.converters.JSON

class ProducerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }
    def show() {
        def producerInstance = Producer.get(params.id)
        if (!producerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'producer.label', default: 'Producer'), id])
            redirect(action: "list")
            return
        }

      [producer: producerInstance]
    }

    def producerStaffForm(){
        def producerStaffInstance
        if(params.id)
            producerStaffInstance = ProducerStaff.get(params.id)
        else
            producerStaffInstance = new ProducerStaff()

        render(template: "producerStaffs_form", model: [producerStaffInstance: producerStaffInstance, producerId: params.producerId])
    }

    def producerAccountForm(){
        def producerAccountInstance
        if(params.id)
            producerAccountInstance = ProducerAccount.get(params.id)
        else
            producerAccountInstance = new ProducerAccount()

        render(template: "producerAccounts_form", model: [producerAccountInstance: producerAccountInstance, producerId: params.producerId])

    }

    def showProducingProduct(){
        def producingProductInstance = ProducingProduct.get(params.id)
        if (!producingProductInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'producingProducts.label', default: 'producingProducts'), id])
            redirect(action: "list")
            return
        }

        [producingProductInstance: producingProductInstance]
    }

    def form(){
        def producerInstance
        if(params.id)
            producerInstance = Producer.get(params.id)
        else
            producerInstance = new Producer()

        render(template: "form", model: [producerInstance: producerInstance])
    }

    def staffRole(){
        def staffRole
        if(params.id)
            staffRole = StaffRole.get(params.id)
        else
            staffRole = new StaffRole()

        render(template: "staffRole_form", model: [staffRoleInstance: staffRole])
    }



    def list() {
    }

    def saveProducerAccount(){
        def producerAccount
        if(params.id){
            producerAccount = ProducerAccount.get(params.id)
            producerAccount.properties = params
        }
        else
            producerAccount = new ProducerAccount(params)

        if(producerAccount.validate() && producerAccount.save()){
            render producerAccount as JSON
        }
        else
            render producerAccount.errors.toString()
    }

    def saveProducerStaff(){
        def producerStaff
        if(params.id){
            producerStaff = ProducerStaff.get(params.id)
            producerStaff.properties = params
        }
        else
            producerStaff = new ProducerStaff(params)
        if(producerStaff.validate() && producerStaff.save()){
            render producerStaff as JSON
        }
        else
            render producerStaff.errors.toString()
    }


    def saveStaffRole(){
        def staffRole
        if(params.id){
            staffRole = StaffRole.get(params.id)
            staffRole.properties = params
        }
        else
            staffRole = new StaffRole(params)
        if(staffRole.validate() && staffRole.save()){
            render staffRole as JSON
        }
        else
            render staffRole.errors.toString()
    }


    def save() {
        def producerInstance
        if(params.id){
            producerInstance = Producer.get(params.id)
            producerInstance.properties = params
        }
        else
            producerInstance = new Producer(params)
        if(producerInstance.validate() && producerInstance.save()){
            render producerInstance as JSON
        }
        else
              render producerInstance.errors.toString()
            //render(template: "form", model: [producerInstance: producerInstance])
    }

    def delete() {
        def producerInstance = Producer.get(params.id)

        ProducingProduct.findAllByProducer(producerInstance).each {
            if(it.productTypes){
                it.productTypes = null
                it.save()
            }

            it.delete(flush: true)
        }
        if (producerInstance.producingProducts)
            producerInstance.producingProducts = null
        producerInstance.save()
        producerInstance.delete(flush: true)
        render 0
    }

    def deleteProducerStaff(){
        def producerStaff = ProducerStaff.get(params.id)
        producerStaff.delete(flush: true)
        render 0
    }

    def deleteProducerAccount(){
        def producerAccount = ProducerAccount.get(params.id)
        producerAccount.delete(flush: true)
        render 0
    }

    def details() {
        def producerInstance = Producer.get(params.id)

        [producerInstance: producerInstance]
    }
}
