package eshop.payment

import eshop.accounting.Account
import eshop.payment.saman.PaymentIFBindingLocator
import eshop.payment.saman.PaymentIFBindingSoap_PortType

class SamanService {

    PaymentIFBindingSoap_PortType getService(){
        new PaymentIFBindingLocator().getPaymentIFBindingSoap()
    }

    Double verifyPayment(Account account, String referenceNumber){

        def onlinePaymentConfiguration = new XmlParser().parseText(account.onlinePaymentConfiguration)

        def result = getService().verifyTransaction(referenceNumber, onlinePaymentConfiguration.userName.text())

        return result
    }
}
