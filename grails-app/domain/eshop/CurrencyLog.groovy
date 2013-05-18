package eshop

class CurrencyLog {
    static auditable = true
    Currency currency
    Date startDate
    Date endDate
    double exchangeRate

    static constraints = {
        endDate(nullable: true)
    }
}
