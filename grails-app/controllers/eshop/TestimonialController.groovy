package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class TestimonialController {

    def springSecurityService

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def testimonialInstance
        if (params.id)
            testimonialInstance = Testimonial.get(params.id)
        else
            testimonialInstance = new Testimonial()
        render(template: "form", model: [testimonialInstance: testimonialInstance])
    }

    def list() {
    }

    def save() {
        def testimonialInstance
        if (params.id) {
            testimonialInstance = Testimonial.get(params.id)
            testimonialInstance.properties = params
        } else {
            testimonialInstance = new Testimonial(params)
            testimonialInstance.creationDate = new Date()
        }
        testimonialInstance.lastModifyDate = new Date()
        testimonialInstance.lastReviewer = springSecurityService.currentUser as User
        if (testimonialInstance.validate() && testimonialInstance.save()) {
            render testimonialInstance as JSON
        } else
            render(template: "form", model: [testimonialInstance: testimonialInstance])
    }


    def delete() {
        def testimonialInstance = Testimonial.get(params.id)
        testimonialInstance.delete(flush: true)
        render 0
    }

    def write() {

    }

    def saveNew() {
        def testimonialInstance = new Testimonial()
        testimonialInstance.writerInfo = params.writerInfo
        testimonialInstance.purchasedProduct = params.purchasedProduct
        testimonialInstance.body = params.body
        testimonialInstance.writer = springSecurityService.currentUser as Customer
        testimonialInstance.approved = false
        testimonialInstance.creationDate = new Date()
        testimonialInstance.lastModifyDate = new Date()
        testimonialInstance.save()
        flash.message = message(code:'testimonial.save.success')
        redirect(controller: 'customer', action: 'panel')
    }
}
