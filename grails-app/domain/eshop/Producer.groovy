package eshop

import org.apache.commons.collections.FactoryUtils
import org.apache.commons.collections.list.LazyList

class Producer {
    static auditable = true
    ProducerType producerType
    String name
    String address
    String warehouseAddress
    String phone
    String fax

    static hasMany = [producerAccounts: ProducerAccount, producerStaffs : ProducerStaff, producingProducts: ProducingProduct]


    static mapping = {
        sort 'id'
        producerStaffs cascade: "all-delete-orphan"
        producerAccounts cascade: "all-delete-orphan"
    }

    static searchable = true

    static constraints = {
        producerType(nullable: true)
        name()
        address(nullable: true)
        warehouseAddress(nullable: true)
        phone(nullable: true)
        fax(nullable: true)
    }

    String toString(){
        name
    }
}
