package eshop

import ir.agah.zanbil.sms.sms1000.SmsLocator
import org.codehaus.groovy.grails.commons.ApplicationHolder
import org.grails.plugins.wsclient.service.WebService

class MessageService {

    WebService webService

    static String userName = "parmir"
    static String userPassword = "p@rmir"
    static String senderNumber = '02142328'

    def sendMessage(String cellphones, String message) {
        def messageService=new SmsLocator().getsmsSoap()

        def result = messageService.doSendSMS(
                userName,
                userPassword,
                senderNumber,
                cellphones,
                message,
                true)

        return result
    }
}
