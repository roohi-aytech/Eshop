package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class NewsLetterCategoryController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def newsLetterCategoryInstance
        if (params.id)
            newsLetterCategoryInstance = NewsLetterCategory.get(params.id)
        else
            newsLetterCategoryInstance = new NewsLetterCategory()
        render(template: "form", model: [newsLetterCategoryInstance: newsLetterCategoryInstance])
    }

    def list() {
    }

    def save() {
        def newsLetterCategoryInstance
        if (params.id) {
            newsLetterCategoryInstance = NewsLetterCategory.get(params.id)
            newsLetterCategoryInstance.properties = params
        } else
            newsLetterCategoryInstance = new NewsLetterCategory(params)
        if (newsLetterCategoryInstance.validate() && newsLetterCategoryInstance.save()) {
            render newsLetterCategoryInstance as JSON
        } else
            render(template: "form", model: [newsLetterCategoryInstance: newsLetterCategoryInstance])
    }


    def delete() {
        def newsLetterCategoryInstance = NewsLetterCategory.get(params.id)
        newsLetterCategoryInstance.deleted = true
        newsLetterCategoryInstance.save()
        render 0
    }
}
