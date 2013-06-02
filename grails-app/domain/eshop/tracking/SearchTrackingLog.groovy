package eshop.tracking

import eshop.*

class SearchTrackingLog extends TrackingLog {

    String phrase
    ProductType productType
    String referrerUrl

    static hasMany = [brands: Brand]

    static constraints = {
        phrase nullable: true
        productType nullable: true
        referrerUrl nullable: true
    }

    @Override
    String getType(){
        "Search"
    }
}
