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
