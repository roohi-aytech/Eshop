package eshop

import eshop.sms.sms1000.SmsLocator
import org.codehaus.groovy.grails.commons.ApplicationHolder
import org.grails.plugins.wsclient.service.WebService

class MessageService {
    def grailsApplication

    static parameters = [
            zanbil : [
                    userName    : "parmir",
                    userPassword: "p@rmir",
                    senderNumber: '02142328'
            ],
            felfel : [
                    userName    : "felfel",
                    userPassword: "88357438",
                    senderNumber: '02188357438'
            ],
            goldaan: [
                    userName    : "ofogh",
                    userPassword: "f@n@v@r@n",
                    senderNumber: '500012001048551'
            ]
    ]

    def sendMessage(String cellphones, String message) {
        def result

        try {
            if(grailsApplication.config.eShop.instance=='goldaan'){
                def messageService = new eshop.sms.rahyab.SmsLocator().getsmsSoap()
                result = messageService.doSendSMS(
                        parameters[grailsApplication.config.eShop.instance].userName,
                        parameters[grailsApplication.config.eShop.instance].userPassword,
                        parameters[grailsApplication.config.eShop.instance].senderNumber,
                        cellphones,
                        message,
                        true,false,false,'')
            }else {
                def messageService = new SmsLocator().getsmsSoap()

                result = messageService.doSendSMS(
                        parameters[grailsApplication.config.eShop.instance].userName,
                        parameters[grailsApplication.config.eShop.instance].userPassword,
                        parameters[grailsApplication.config.eShop.instance].senderNumber,
                        cellphones,
                        message,
                        true)
            }
        } catch (x) {
            x.printStackTrace()
        }
        return result
    }
}
