package eshop

class Currency {
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
