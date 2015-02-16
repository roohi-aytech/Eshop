package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class NewsLetterController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def newsLetterInstance
        if (params.id)
            newsLetterInstance = NewsLetter.get(params.id)
        else
            newsLetterInstance = new NewsLetter()
        render(template: "form", model: [newsLetterInstance: newsLetterInstance])
    }

    def list() {
    }

    def save() {
        NewsLetter newsLetterInstance
        if (params.id) {
            newsLetterInstance = NewsLetter.get(params.id)
            newsLetterInstance.productTypes.clear()
            newsLetterInstance.properties = params
        } else
            newsLetterInstance = new NewsLetter(params)

        if (params.sendTime) {
            def hours = params.sendTime.toString().split(':')[0].toInteger()
            def minutes = params.sendTime.toString().split(':')[1].toInteger()
            newsLetterInstance.sendDate.hours = hours
            newsLetterInstance.sendDate.minutes = minutes
        }

        if (newsLetterInstance.validate() && newsLetterInstance.save()) {
            scheduleNewsLetter(newsLetterInstance)
            render newsLetterInstance as JSON
        } else
            render(template: "form", model: [newsLetterInstance: newsLetterInstance])
    }

    def scheduleNewsLetter(NewsLetter newsLetter){
        if (newsLetter.sendDate > new Date()){

            NewsLetterInstance.findAllByNewsLetterAndStatusInList(newsLetter, ['scheduled', 'started']).each {newsLetterInstance ->
                newsLetterInstance.status = 'suspended'
                newsLetterInstance.finishDate = new Date()
                newsLetterInstance.save()
            }

            def newsLetterInstance = new NewsLetterInstance()
            newsLetterInstance.newsLetter = newsLetter
            newsLetterInstance.status = 'scheduled'
            newsLetterInstance.startDate = newsLetter.sendDate
            newsLetterInstance.save()

            NewsLetterJob.schedule(newsLetter.sendDate, [newsLetterInstance: newsLetterInstance])
        }
    }


    def delete() {
        def newsLetterInstance = NewsLetter.get(params.id)
        newsLetterInstance.deleted = true
        newsLetterInstance.save()
        render 0
    }
}
