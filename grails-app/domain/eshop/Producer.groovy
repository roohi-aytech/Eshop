package eshop

import org.apache.commons.collections.FactoryUtils
import org.apache.commons.collections.list.LazyList

class Producer {
    ProducerType producerType
    String name
    String address
    String phone
    String fax



    byte[] logo
    static hasMany = [producerStaffs : ProducerStaff]
    static composites = ["producerStaffs"]

    static mapping = {
        sort 'name'
//        producerStaffs cascade: "all-delete-orphan"
//        producingProducts cascade: "all-delete-orphan"
      //  products cascade: "all-delete-orphan"
    }

    static searchable = true

    static constraints = {
        producerType(nullable: true)
        name()
        address(nullable: true)
        phone()
        fax()
        producerStaffs()
     //   producingProducts()
        logo(nullable: true, maxSize: 1000000000)
    }

    String toString(){
        name
    }
}
