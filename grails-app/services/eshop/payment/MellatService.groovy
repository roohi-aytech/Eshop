package eshop.payment

import eshop.accounting.Account
import eshop.payment.mellat.IPaymentGateway
import eshop.payment.mellat.PaymentGatewayImplServiceLocator

class MellatService {

    IPaymentGateway getService(){
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
