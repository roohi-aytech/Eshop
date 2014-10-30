package eshop

class ProducerVariations {
    static auditable = true

    Producer producer
    Product product

    static hasMany = [variationValues : VariationValue]
    Guarantee guarantee

    static constraints = {
        producer()

    }
}
