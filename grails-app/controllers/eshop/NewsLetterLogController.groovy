package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class NewsLetterLogController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def newsLetterLogInstance
        if (params.id)
            newsLetterLogInstance = NewsLetterLog.get(params.id)
        else
            newsLetterLogInstance = new NewsLetterLog()
        render(template: "form", model: [newsLetterLogInstance: newsLetterLogInstance])
    }

    def list() {
    }

    def save() {
        def newsLetterLogInstance
        if (params.id) {
            newsLetterLogInstance = NewsLetterLog.get(params.id)
            newsLetterLogInstance.properties = params
        } else
            newsLetterLogInstance = new NewsLetterLog(params)
        if (newsLetterLogInstance.validate() && newsLetterLogInstance.save()) {
            render newsLetterLogInstance as JSON
        } else
            render(template: "form", model: [newsLetterLogInstance: newsLetterLogInstance])
    }


    def delete() {
        def newsLetterLogInstance = NewsLetterLog.get(params.id)
        newsLetterLogInstance.delete(flush: true)
        render 0
    }
}
