package eshop

class CurrencyLog {
    Currency currency
    Date startDate
    Date endDate
    double exchangeRate

    static constraints = {
        endDate(nullable: true)
    }
}
