package eshop

class Currency {
    String name
    double exchangeRate
    static constraints = {
        name(blank: false,unique: true)
        exchangeRate(min: 0D)
    }
    String toString(){
        name
    }
}
