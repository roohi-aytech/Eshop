package eshop

import org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib

class GeneralFilters {

    def filters = {
        all(controller: '*', action: '*') {
            before = {
                if (request.serverName != 'localhost' && !request.serverName.toString().startsWith("www")) {
                    def targetUrl = new ApplicationTagLib().createLink(
                            [
                                    controller: controllerName,
                                    action: actionName,
                                    params: params,
                                    absolute: true
                            ]).toString()
                            .replace("http://", "http://www.")
                            .replace("/site/index", "/")
                            .replace("/default/", "/")

                    response.setStatus(301);
                    response.setHeader("Location", targetUrl)
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
