package eshop

import eshop.sms.sms1000.SmsLocator
import org.codehaus.groovy.grails.commons.ApplicationHolder
import org.grails.plugins.wsclient.service.WebService

class MessageService {
    def grailsApplication

    static parameters=[
            zanbil:[
                    userName : "parmir",
                    userPassword : "p@rmir",
                    senderNumber : '02142328'
            ],
            felfel:[
                    userName : "felfel",
                    userPassword : "88357438",
                    senderNumber : '02188357438'
            ]
    ]

    def sendMessage(String cellphones, String message) {
        def messageService=new SmsLocator().getsmsSoap()

        def result = messageService.doSendSMS(
                parameters[grailsApplication.config.eShop.instance].userName,
                parameters[grailsApplication.config.eShop.instance].userPassword,
                parameters[grailsApplication.config.eShop.instance].senderNumber,
                cellphones,
                message,
                true)

        return result
    }
}
