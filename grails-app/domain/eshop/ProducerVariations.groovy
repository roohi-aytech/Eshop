package eshop

class ProducerVariations {

    Producer producer
    Product product

    static hasMany = [variationValues : VariationValue]

    static constraints = {
        producer()

    }
}
