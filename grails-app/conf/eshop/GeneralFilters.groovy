package eshop

class GeneralFilters {

    def filters = {
        all(controller: '*', action: '*') {
            before = {
                if (request.serverName != 'localhost' && !request.serverName.toString().startsWith("www")) {
                    response.setStatus(301);
                    response.setHeader("Location", request.requestURL.toString()
                            .replace('/grails', '')
                            .replace('/default/', '/')
                            .replace('.dispatch', '')
                            .replace('site.dispatch', '')
                            .replace('site/browse.dispatch', 'browse')
                            .replace('site/filter.dispatch', 'filter')
                            .replace('site/search.dispatch', 'search')
                            .replace('site/article.dispatch', 'article')
                            .replace('site/contactUs.dispatch', 'contactUs')
                            .replace('site/termsAndConditions.dispatch', 'termsAndConditions')
                            .replace('http://', 'http://www.')
                    )
                    response.flushBuffer()
                    return false; // return false, otherwise request is handled from controller
                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
