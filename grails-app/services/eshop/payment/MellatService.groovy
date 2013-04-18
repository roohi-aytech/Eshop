package eshop.payment

import org.grails.plugins.wsclient.service.WebService
import org.codehaus.groovy.grails.commons.ApplicationHolder

class MellatService {

    WebService webService
    def servletContext

    static Integer terminalId = 642244
    static String userName = "tajan"
    static String userPassword = "20796"

    def prepareForPayment(id, amount, customerId) {
        def wsdl = ApplicationHolder.application.parentContext.getResource('WEB-INF/mellatService.wsdl')
        def bpService = webService.getClient(wsdl.getURL().toString())
        def result = bpService.bpPayRequest(
                terminalId,
                userName,
                userPassword,
                id,
                amount,
                new Date().format('yyyyMMdd'),
                new Date().format('HHmmss'),
                'OnlinePayment',
                "http://www.tajan.it/order/paymentResult/mellat/",
                customerId)

        return result.toString().split(',')
    }
}
