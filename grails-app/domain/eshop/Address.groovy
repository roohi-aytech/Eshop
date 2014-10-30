package eshop

import eshop.City
import eshop.Province

class Address {
    static auditable = true
    String title
    String addressLine1;
    String addressLine2;
    City city;
    String postalCode;
    String telephone;


    static constraints = {
        title(nullable:true)
        addressLine2(nullable: true)
        city(nullable: true)
        postalCode(nullable: true)
        telephone(nullable: true)
    }

    String toString() {
        "${title?"${title} - ":''}${city?.province?"${city?.province} - ":''}${city?"${city} - ":''}${addressLine1?:''} ${addressLine2?:''} - ${postalCode?"${postalCode} - ":''}${telephone?: ''}"
    }
}
