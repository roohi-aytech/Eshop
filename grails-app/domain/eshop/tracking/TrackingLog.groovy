package eshop.tracking

import eshop.*

class TrackingLog {

    String type
    Customer customer
    Date date
    String ipAddress
    String browserName
    String browserVersion
    String operatingSystem

    static transients = ['type']

    static constraints = {
        customer nullable: true
    }
}
