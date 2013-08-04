package eshop.payment

import eshop.*
import eshop.accounting.OnlinePayment
import org.grails.plugins.wsclient.service.WebService
import org.codehaus.groovy.grails.commons.ApplicationHolder

class MellatService {

    WebService webService

    static Integer terminalId = 642244
    static String userName = "tajan"
    static String userPassword = "20796"

    def prepareForPayment(eshop.accounting.Account account, id, amount, customerId) {
        def g = ApplicationHolder.application.mainContext.getBean( 'org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib' )
        def wsdl = ApplicationHolder.application.parentContext.getResource('WEB-INF/mellatService.wsdl')
        def bpService = webService.getClient(wsdl.getURL().toString())
        def onlinePaymentConfiguration = new XmlParser().parseText(account.onlinePaymentConfiguration)
        def result = bpService.bpPayRequest(
                onlinePaymentConfiguration.terminalCode.text().toLong(),
                onlinePaymentConfiguration.userName.text(),
                onlinePaymentConfiguration.password.text(),
                id.toLong(),
                amount.toLong(),
                new Date().format('yyyyMMdd'),
                new Date().format('HHmmss'),
                'OnlinePayment',
                "http://www.zanbil.ir/order/onlinePaymentResult/",
                0).toString().split(',')

        return result
    }
}
