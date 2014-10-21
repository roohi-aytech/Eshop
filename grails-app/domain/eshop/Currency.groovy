package eshop

class Currency {
    static auditable = true
    String name
    double exchangeRate
    boolean display

    static mapping = {
        sort 'name'
    }
    static constraints = {
        name(blank: false,unique: true)
        exchangeRate(min: 0D)
        display(nullable:false)
    }
    String toString(){
        name
    }
}
