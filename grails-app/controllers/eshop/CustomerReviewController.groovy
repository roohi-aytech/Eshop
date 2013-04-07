package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class CustomerReviewController {

    def springSecurityService

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
        } else {
            def product = Product.get(params.productId)
            customerReviewInstance = new CustomerReview()
            customerReviewInstance.product = product
            customerReviewInstance.title = params.reviewTitle
            customerReviewInstance.rate = Integer.parseInt(params.reviewRate)
            customerReviewInstance.body = params.reviewBody
            customerReviewInstance.creationDate = new Date()
            customerReviewInstance.lastUpdate = new Date()
            customerReviewInstance.user = springSecurityService.currentUser
        }
        if (customerReviewInstance.validate() && customerReviewInstance.save()) {
            render(template: "show", model: [customerReviewInstance: customerReviewInstance])
        } else
            render customerReviewInstance.errors
    }


    def delete() {
        def customerReviewInstance = CustomerReview.get(params.id)
        customerReviewInstance.delete(flush: true)
        render 0
    }
}
