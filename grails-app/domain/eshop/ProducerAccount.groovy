package eshop

class ProducerAccount {
    static auditable = true

    Producer producer
    String bank
    String branch
    String branchCode
    String accountNo
    String shebaNo
    String cardNo
    String name
    static belongsTo = [Producer]
    static searchable = true

    static mapping = {
        sort 'name'
    }

    static constraints = {
        bank(nullable: true)
        branch(nullable: true)
        branchCode(nullable: true)
        accountNo(nullable: true)
        shebaNo(nullable: true)
        cardNo(nullable: true)
        name(nullable: true)
    }

    String toString(){
        name
    }
}
