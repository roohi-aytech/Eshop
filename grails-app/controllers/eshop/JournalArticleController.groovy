package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class JournalArticleController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def journalArticleInstance
        if (params.id)
            journalArticleInstance = JournalArticle.get(params.id)
        else
            journalArticleInstance = new JournalArticle(params)
        render(template: "form", model: [journalArticleInstance: journalArticleInstance])
    }

    def list() {
    }

    def save() {
        def journalArticleInstance
        if (params.id) {
            journalArticleInstance = JournalArticle.get(params.id)
            journalArticleInstance.properties = params
        }
        else
            journalArticleInstance = new JournalArticle(params)
        if (journalArticleInstance.validate() && journalArticleInstance.save()) {
            render journalArticleInstance as JSON
        }
        else
            render(template: "form", model: [journalArticleInstance: journalArticleInstance])
    }


    def delete() {
        def journalArticleInstance = JournalArticle.get(params.id)
        journalArticleInstance.delete(flush: true)
        render 0
    }
}
