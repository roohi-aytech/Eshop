package eshop

class ProducerVariations {

    Producer producer
    Product product

    static hasMany = [variationValues : VariationValue]
    Guarantee guarantee

    static constraints = {
        producer()

    }
}
