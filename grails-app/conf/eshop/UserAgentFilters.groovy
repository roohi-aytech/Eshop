package eshop

class UserAgentFilters {

    def userAgentIdentService

    def filters = {
        all(controller: '*', action: '*') {
            before = {
                def userAgent = userAgentIdentService.userAgentString.toLowerCase()
                if (userAgentIdentService.browser.toLowerCase().contains('robot') &&
                        !userAgent.contains('googlebot') &&
                        !userAgent.contains('bingbot') &&
                        !userAgent.contains('yahoo')) {
                    response.setStatus(403);
                    response.flushBuffer()
                    return false
                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
