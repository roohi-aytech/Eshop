package eshop

class MessageLoggerTagLib {
    static namespace = "g"

    def message2 = { attrs ->
        println "${attrs.code}"
        def messagesFile = grailsApplication.config.eshop.messages.file
        messagesFile.append("${attrs.code}\n")

        def validationTagLib = grailsApplication.mainContext.getBean('org.codehaus.groovy.grails.plugins.web.taglib.ValidationTagLib')
        validationTagLib.messageImpl(attrs)
    }
}