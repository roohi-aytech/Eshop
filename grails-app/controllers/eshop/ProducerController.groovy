package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON
import grails.plugins.springsecurity.Secured

@Secured(RoleHelper.ROLE_PRODUCT_TYPE_ADMIN)
class ProducerController {

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
    }

    def form() {
        def producer
        if (params.id)
            producer = Producer.findById(params.id)
        else
            producer = new Producer()

        render(template: "form", model: [producerInstance: producer])
    }

    def producerStaffForm() {
        def producerStaff
        if (params.id)
            producerStaff = ProducerStaff.findById(params.id)
        else
            producerStaff = new ProducerStaff(params)
        render(template: "producer_staff_add", model: [producerStaffInstance: producerStaff])
    }

    def saveProducerStaff() {
        def producerStaff
        if (params.id) {
            producerStaff = ProducerStaff.findById(params.id)
            producerStaff.properties = params
        }
        else {
            producerStaff = new ProducerStaff(params)
            producerStaff.indx = 0
        }
        producerStaff.save()
        render producerStaff as JSON
    }

    def searchProducerStaffs() {
        def producer = Producer.get(params.producerId)
        def values = ProducerStaff.findAllByProducerAndValueIlike(producer, "%${params.term}%")
        def map = values.collect {
            [id: it.id, label: it.toString(), value: it.toString()]
        }
        render map as JSON
    }

    def save() {
        def producer
        if (params.id) {
            producer = Producer.get(params.id)
            producer.properties = params
        }
        else
            producer = new Producer(params)
        bindComposites(producer, params)
        producer.save()
        render 0
    }

    def delete() {
        def producer = Producer.get(params.id)
        if (producer)
            producer.delete()
        render 0
    }




}
