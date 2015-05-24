package eshop

class UserAgentFilters {

    def userAgentIdentService

    def filters = {
        all(controller: '*', action: '*') {
            before = {
                try {
                    session["mobile"] = userAgentIdentService.isMobile()

                    def userAgent = userAgentIdentService?.userAgentString?.toLowerCase()
                    if (userAgentIdentService?.browser?.toLowerCase()?.contains('robot') &&
                            !userAgent?.contains('googlebot') &&
                            !userAgent?.contains('bingbot') &&
                            !userAgent?.contains('ask jeeves/teoma') &&
                            !userAgent?.contains('yahoo')) {
                        response.setStatus(403);
                        response.flushBuffer()
                        return false
                    }
                }catch (x){
                    printf "Handled Exception"
                    x.printStackTrace()
                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
