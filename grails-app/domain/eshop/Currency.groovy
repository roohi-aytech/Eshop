package eshop

class Currency {
    static auditable = true
    String name
    double exchangeRate

    static mapping = {
        sort 'name'
    }
    static constraints = {
        name(blank: false,unique: true)
        exchangeRate(min: 0D)
    }
    String toString(){
        name
    }
}
