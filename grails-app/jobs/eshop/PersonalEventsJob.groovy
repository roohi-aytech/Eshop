package eshop

import grails.gsp.PageRenderer


class PersonalEventsJob {

    def mailService
    def messageService
    def messageSource
    PageRenderer groovyPageRenderer
    static triggers = {
        cron name: 'myTrigger', cronExpression: "0 0 9 * * ?"
//        simple repeatInterval: 60000
    }

    def execute() {
        println 'Personal Event Scheduler'
        def now = new Date()
        def cal = Calendar.instance
        cal.set(Calendar.HOUR_OF_DAY, 0)
        cal.set(Calendar.MINUTE, 0)
        cal.set(Calendar.SECOND, 0)
        cal.set(Calendar.MILLISECOND, 0)
        def dates = []
        cal.add(Calendar.DATE, 2)
        dates.add(cal.time)
        cal.add(Calendar.DATE, 2)
        dates.add(cal.time)
        cal.add(Calendar.DATE, 3)
        dates.add(cal.time)

        PersonalEvent.findAllByDateInList(dates).each { personalEvent ->
            def productType = ProductType.findByName(personalEvent.title)
            def dayRemaining = personalEvent.date.minus(now)
            if(dayRemaining==2){
                def c=Calendar.instance
                c.time=personalEvent.date
                c.add(Calendar.YEAR,1)
                personalEvent.date=c.time
                personalEvent.save()
            }
            if (personalEvent.emailNotification && personalEvent.customer.email) {
                mailService.sendMail {
                    to personalEvent.customer.email
                    subject(messageSource.getMessage('emailTemplates.notification.subject', new Object[0], "", null))
                    html(view: "/messageTemplates/${grailsApplication.config.eShop.instance}_email_template",
                            model: [message: groovyPageRenderer.render(template: '/messageTemplates/mail/personal_event', model: [personalEvent: personalEvent, productType: productType, dayRemaining: dayRemaining]).toString()])
                }
            }
            if (personalEvent.smsNotification && personalEvent.customer.mobile) {
                messageService.sendMessage(
                        personalEvent.customer.mobile,
                        groovyPageRenderer.render(template: '/messageTemplates/sms/personal_event', model: [personalEvent: personalEvent, dayRemaining: dayRemaining]).toString())
            }
        }


    }
}
