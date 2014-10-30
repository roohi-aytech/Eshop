package eshop.tracking

class SignInTrackingLog extends TrackingLog {

    static constraints = {
    }

    @Override
    String getType(){
        "SignIn"
    }
}
