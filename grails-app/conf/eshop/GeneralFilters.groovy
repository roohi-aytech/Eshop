package eshop

import org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib

class GeneralFilters {

    def filters = {
        all(controller: '*', action: '*') {
            before = {
                if(!grailsApplication.config.force.www)
                    return true

                if (request.serverName != 'localhost' && !request.serverName.startsWith('local.') && !request.serverName.toString().startsWith("www")) {
                    def targetUrl = new ApplicationTagLib().createLink(
                            [
                                    controller: controllerName,
                                    action: actionName,
                                    params: params,
                                    absolute: true
                            ]).toString()
//                            .replace("http://", "http://www.")
                            .replace("/site/index", "/")
                            .replace("/default/", "/")
                    if (!targetUrl.startsWith("http://www."))
                        targetUrl = targetUrl.replace("http://", "http://www.")

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
