package eshop.payment

import eshop.*
import eshop.accounting.Account
import eshop.accounting.OnlinePayment
import org.grails.plugins.wsclient.service.WebService
import org.codehaus.groovy.grails.commons.ApplicationHolder

class MellatService {

    WebService webService

    static Integer terminalId = 642244
    static String userName = "tajan"
    static String userPassword = "20796"

    def getService(){
        def wsdl = ApplicationHolder.application.parentContext.getResource('WEB-INF/mellatService.wsdl')
        webService.getClient(wsdl.getURL().toString())
    }

    def prepareForPayment(Account account, id, amount, customerId) {
        def onlinePaymentConfiguration = new XmlParser().parseText(account.onlinePaymentConfiguration)
        def result = getService().bpPayRequest(
                onlinePaymentConfiguration.terminalCode.text().toLong(),
                onlinePaymentConfiguration.userName.text(),
                onlinePaymentConfiguration.password.text(),
                id.toLong(),
                amount.toLong(),
                new Date().format('yyyyMMdd'),
                new Date().format('HHmmss'),
                'OnlinePayment',
                "http://www.zanbil.ir/order/onlinePaymentResultMellat",
                0).toString().split(',')

        return result
    }

    def verifyPayment(Account account, orderId, saleOrderId, saleReferenceId){
        def onlinePaymentConfiguration = new XmlParser().parseText(account.onlinePaymentConfiguration)
        def result = getService().bpPayRequest(
                onlinePaymentConfiguration.terminalCode.text().toLong(),
                onlinePaymentConfiguration.userName.text(),
                onlinePaymentConfiguration.password.text(),
                orderId.toLong(),
                saleOrderId.toLong(),
                saleReferenceId.toLing()).toString()

        return result
    }
}
