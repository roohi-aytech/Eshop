package eshop.payment

import eshop.accounting.Account
import eshop.payment.saman.PaymentIF
import eshop.payment.saman.ReferencePaymentLocator

class SamanService {

    PaymentIF getService(){
        new ReferencePaymentLocator().getPaymentIFPort()
    }

    Double verifyPayment(Account account, String referenceNumber){

        def onlinePaymentConfiguration = new XmlParser().parseText(account.onlinePaymentConfiguration)

        def result = getService().verifyTransaction(referenceNumber, onlinePaymentConfiguration.userName.text())

        return result
    }
}
