package eshop

import org.apache.commons.collections.FactoryUtils
import org.apache.commons.collections.list.LazyList

class Producer {
    static auditable = true
    ProducerType producerType
    String name
    String address
    String phone
    String fax

    static hasMany = [producerStaffs : ProducerStaff, producingProducts: ProducingProduct]

    static mapping = {
        sort 'id'
        producerStaffs cascade: "all-delete-orphan"
    }

    static searchable = true

    static constraints = {
        producerType(nullable: true)
        name()
        address(nullable: true)
        phone()
        fax()
        producerStaffs()
    }

    String toString(){
        name
    }
}
