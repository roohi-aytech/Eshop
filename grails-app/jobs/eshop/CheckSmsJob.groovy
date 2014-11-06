package eshop

import grails.util.Environment


class CheckSmsJob {
    def messageService
    def mailService
    def grailsApplication
    static triggers = {
        simple repeatInterval: 86400000, startDelay: 6000 // execute job once in 2 minutes
    }

    def execute() {
        if(Environment.current == Environment.DEVELOPMENT)
            return

        println 'checking remaining sms: '
        def res = grailsApplication.config.instance + " " + messageService.info
        println res
        mailService.sendMail {
            to 'info@agah-it.com'
            subject 'remaining sms ' + res
            body res
        }
    }
}
