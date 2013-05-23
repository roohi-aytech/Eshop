package eshop

import grails.converters.JSON

class ProducerController {

//    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

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

      [producerInstance: producerInstance]
    }

    def producerStaffForm(){
        def producerStaffInstance
        if(params.id)
            producerStaffInstance = ProducerStaff.get(params.id)
        else
            producerStaffInstance = new ProducerStaff()

        render(template: "producerStaffs_form", model: [producerStaffInstance: producerStaffInstance, producerId: params.producerId])
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

        render(template: "staffRole", model: [staffRoleInstance: staffRole])
    }



    def list() {
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
            it.producer = null
            it.save()
            it.delete()
        }
        producerInstance.delete(flush: true)
        render 0
    }

    def deleteProducerStaff(){
        def producerStaff = ProducerStaff.get(params.id)
        producerStaff.delete(flush: true)
        render 0
    }

    def details() {
        def producerInstance = Producer.get(params.id)

        [producerInstance: producerInstance]
    }
}
