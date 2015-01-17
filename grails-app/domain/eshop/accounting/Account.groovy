package eshop.accounting

import org.codehaus.groovy.grails.commons.ApplicationHolder

class Account {

    static auditable = true
    String bankName
    byte[] bankLogo
    Boolean hasOnlinePayment
    String branchName
    String ownerName
    String accountNumber
    String shebaNumber
    String cardNumber
    String type
    String onlinePaymentConfiguration

    static constraints = {
        bankName inList: ['mellat', 'saman', 'ogone']
        type(inList: ['legal', 'real'])
        branchName(nullable: true)
        ownerName(nullable: true)
        accountNumber(nullable: true)
        shebaNumber(nullable: true)
        cardNumber(nullable: true)
        hasOnlinePayment()
        bankLogo(nullable: true, maxSize: 1000000000)
        onlinePaymentConfiguration nullable: true, maxSize: 100000
    }

    String toString(){
        def g = ApplicationHolder.application.mainContext.getBean( 'org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib' )
        g.message(code:"account.${bankName}.${type}")
    }
}
