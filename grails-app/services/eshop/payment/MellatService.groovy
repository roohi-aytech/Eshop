package eshop.payment

import eshop.*
import eshop.accounting.Account
import eshop.accounting.OnlinePayment
import eshop.payment.mellat.IPaymentGateway
import eshop.payment.mellat.PaymentGatewayImplService
import eshop.payment.mellat.PaymentGatewayImplServiceLocator
import groovyx.net.ws.WSClient
import org.grails.plugins.wsclient.service.WebService
import org.codehaus.groovy.grails.commons.ApplicationHolder

class MellatService {

//    WebService webService

//    static Integer terminalId = 642244
//    static String userName = "tajan"
//    static String userPassword = "20796"

    IPaymentGateway getService(){
//        def wsdl = ApplicationHolder.application.parentContext.getResource('WEB-INF/mellatService.wsdl')
//        webService.getClient(wsdl.getURL().toString())
//        new WSClient("http://local.zanbil.ir/mellatService.wsdl", this.class.classLoader)
        new PaymentGatewayImplServiceLocator().getPaymentGatewayImplPort()
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
        def result = getService().bpVerifyRequest(
                onlinePaymentConfiguration.terminalCode.text().toLong(),
                onlinePaymentConfiguration.userName.text(),
                onlinePaymentConfiguration.password.text(),
                orderId.toLong(),
                saleOrderId.toLong(),
                saleReferenceId.toLong()).toString()

        return result
    }

    def settlePayment(Account account, orderId, saleOrderId, saleReferenceId){
        def onlinePaymentConfiguration = new XmlParser().parseText(account.onlinePaymentConfiguration)
        def result = getService().bpSettleRequest(
                onlinePaymentConfiguration.terminalCode.text().toLong(),
                onlinePaymentConfiguration.userName.text(),
                onlinePaymentConfiguration.password.text(),
                orderId.toLong(),
                saleOrderId.toLong(),
                saleReferenceId.toLong()).toString()

        return result
    }
}
