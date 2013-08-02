package eshop

import org.codehaus.groovy.grails.commons.ApplicationHolder
import org.grails.plugins.wsclient.service.WebService

class MessageService {

    WebService webService

    static String userName = "parmir"
    static String userPassword = "p@rmir"
    static String senderNumber = '02142328'

    def sendMessage(String cellphones, String message) {

        return

        def wsdl = ApplicationHolder.application.parentContext.getResource('WEB-INF/messageService.wsdl')
        def messageService = webService.getClient(wsdl.getURL().toString())
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
