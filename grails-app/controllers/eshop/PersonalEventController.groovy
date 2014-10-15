package eshop

import fi.joensuu.joyds1.calendar.JalaliCalendar
import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class PersonalEventController {

    def springSecurityService

    static allowedMethods = [save: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form() {
        def personalEventInstance
        if (params.id)
            personalEventInstance = PersonalEvent.get(params.id)
        else
            personalEventInstance = new PersonalEvent()
        def month = 0
        def day = 0
        if (personalEventInstance?.date) {
            def cal = Calendar.getInstance()
            cal.setTime(personalEventInstance.date)

            def jc = new JalaliCalendar(cal)
            month = jc.month + 1
            day = jc.day
        }
        render(template: "form", model: [personalEventInstance: personalEventInstance, day: day, month: month])
    }

    def list() {
    }

    def save() {
        def personalEventInstance
        if (params.id) {
            personalEventInstance = PersonalEvent.get(params.id)
            personalEventInstance.properties = params
        } else
            personalEventInstance = new PersonalEvent(params)

        def jc = new JalaliCalendar()
        jc.set(jc.year, params.int('month'), params.int('day'))
        def cal = jc.toJavaUtilGregorianCalendar()
        if (cal.time.before(new Date()))
            cal.add(Calendar.YEAR, 1)
        personalEventInstance.date = cal.time

        personalEventInstance.customer = springSecurityService.currentUser as Customer
        if (personalEventInstance.validate() && personalEventInstance.save()) {
//            render personalEventInstance as JSON
            redirect(controller: 'customer', action: 'profile', params: [tab: 'personalEvents'])
        } else
            render(template: "form", model: [personalEventInstance: personalEventInstance])
    }


    def delete() {
        def personalEventInstance = PersonalEvent.get(params.id)
        personalEventInstance.delete(flush: true)
        redirect(controller: 'customer', action: 'personalEvents')
    }

    def create() {
        def instance = PersonalEvent.newInstance()
        instance.date = new Date()
        [personalEventInstance: instance]
    }

    def edit() {
        def personalEventInstance = PersonalEvent.get(params.id)
        def month = 0
        def day = 0
        if (personalEventInstance?.date) {
            def cal = Calendar.getInstance()
            cal.setTime(personalEventInstance.date)

            def jc = new JalaliCalendar(cal)
            month = jc.month
            day = jc.day
        }
        [personalEventInstance: personalEventInstance, day: day, month: month]
    }
}
