package eshop.eshop

import eshop.City
import eshop.Province

class Address {
    String addressLine1;
    String addressLine2;
    City city;
    Province province;
    String postalCode;
    String telephone;

    static constraints = {
    }
}
