package eshop



class CheckSmsJob {
    def messageService
    def mailService
    static triggers = {
        simple repeatInterval: 86400000, startDelay: 6000 // execute job once in 2 minutes
    }

    def execute() {
        println 'checking remaining sms: '
        def res=messageService.info
        println res
        mailService.sendMail {
            to 'info@agah-it.com'
            subject 'remaining sms '+res
            body res
        }
    }
}
