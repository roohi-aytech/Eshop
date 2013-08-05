package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class NewsLetterInstanceController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def newsLetterInstanceInstance
        if (params.id)
            newsLetterInstanceInstance = NewsLetterInstance.get(params.id)
        else
            newsLetterInstanceInstance = new NewsLetterInstance()
        render(template: "form", model: [newsLetterInstanceInstance: newsLetterInstanceInstance])
    }

    def list() {
    }

    def save() {
        def newsLetterInstanceInstance
        if (params.id) {
            newsLetterInstanceInstance = NewsLetterInstance.get(params.id)
            newsLetterInstanceInstance.properties = params
        } else
            newsLetterInstanceInstance = new NewsLetterInstance(params)
        if (newsLetterInstanceInstance.validate() && newsLetterInstanceInstance.save()) {
            render newsLetterInstanceInstance as JSON
        } else
            render(template: "form", model: [newsLetterInstanceInstance: newsLetterInstanceInstance])
    }


    def delete() {
        def newsLetterInstanceInstance = NewsLetterInstance.get(params.id)
        newsLetterInstanceInstance.delete(flush: true)
        render 0
    }
}
