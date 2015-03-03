package eshop

class Currency {
    static auditable = true
    String name
    String code
    double exchangeRate
    boolean display

    static mapping = {
        sort 'name'
    }
    static constraints = {
        name(blank: false,unique: true)
        code(nullable:true)
        exchangeRate(min: 0D)
        display(nullable:false)
    }
    String toString(){
        name
    }
}
