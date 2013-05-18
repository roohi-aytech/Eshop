package eshop

import eshop.City
import eshop.Province

class Address {
    static auditable = true
    String addressLine1;
    String addressLine2;
    City city;
    String postalCode;
    String telephone;

    static constraints = {
        addressLine2(nullable: true)
        city(nullable: true)
        postalCode(nullable: true)
        telephone(nullable: true)
    }

    String toString(){
        city.province.toString() + " - " +
        city.toString() + " - " +
        addressLine1 + " " + (addressLine2?addressLine2:"") + " - " +
        postalCode
    }
}
