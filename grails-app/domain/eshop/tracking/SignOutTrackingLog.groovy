package eshop.tracking

class SignOutTrackingLog extends TrackingLog {

    static constraints = {
    }

    @Override
    String getType(){
        "SignOut"
    }
}
