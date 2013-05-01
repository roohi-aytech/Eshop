package eshop.accounting

class Account {

    String bankName
    byte[] bankLogo
    Boolean hasOnlinePayment
    String branchName
    String ownerName
    String accountNumber
    String shebaNumber
    String cardNumber

    static constraints = {
        bankName()
        branchName(nullable: true)
        ownerName(nullable: true)
        accountNumber(nullable: true)
        shebaNumber(nullable: true)
        cardNumber(nullable: true)
        hasOnlinePayment()
        bankLogo(nullable: true, maxSize: 1000000000)
    }
}
