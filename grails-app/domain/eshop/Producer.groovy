package eshop

import org.apache.commons.collections.FactoryUtils
import org.apache.commons.collections.list.LazyList

class Producer {
    String name
    String address
    byte[] logo
    static hasMany = [producerStaffs : ProducerStaff, producingProducts: ProducingProduct]
    static composites = ["producerStaffs", "producingProducts"]

    static mapping = {
        sort 'name'
        producerStaffs cascade: "all-delete-orphan"
        producingProducts cascade: "all-delete-orphan"
    }

    static searchable = true

    static constraints = {
        name(unique: true)
        address(nullable: true)
        logo(nullable: true, maxSize: 1000000000)
    }

    String toString(){
        name
    }
}
