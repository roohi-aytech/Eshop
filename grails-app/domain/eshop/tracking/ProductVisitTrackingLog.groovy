package eshop.tracking

import eshop.*

class ProductVisitTrackingLog extends TrackingLog {

    Product product
    String referrerUrl

    static constraints = {
        referrerUrl nullable: true
    }

    @Override
    String getType(){
        "ProductVisit"
    }
}
