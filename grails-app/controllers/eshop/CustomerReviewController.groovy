package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class CustomerReviewController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def customerReviewInstance
        if (params.id)
            customerReviewInstance = CustomerReview.get(params.id)
        else
            customerReviewInstance = new CustomerReview()
        render(template: "form", model: [customerReviewInstance: customerReviewInstance])
    }

    def list() {
    }

    def save() {
        def customerReviewInstance
        if (params.id) {
            customerReviewInstance = CustomerReview.get(params.id)
            customerReviewInstance.properties = params
        } else
            customerReviewInstance = new CustomerReview(params)
        if (customerReviewInstance.validate() && customerReviewInstance.save()) {
            render customerReviewInstance as JSON
        } else
            render(template: "form", model: [customerReviewInstance: customerReviewInstance])
    }


    def delete() {
        def customerReviewInstance = CustomerReview.get(params.id)
        customerReviewInstance.delete(flush: true)
        render 0
    }
}
