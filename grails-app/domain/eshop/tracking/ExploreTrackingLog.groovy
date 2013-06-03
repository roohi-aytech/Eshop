package eshop.tracking

import eshop.*

class ExploreTrackingLog extends TrackingLog {

    ProductType productType
    String referrerUrl

    static hasMany = [brands: Brand]

    static constraints = {
        productType nullable: true
        referrerUrl nullable: true
    }

    @Override
    String getType(){
        "Explore"
    }
}
