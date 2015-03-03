package eshop

class MakeupMessageCodesController {

    def index() {
        File messagesFile = grailsApplication.config.eshop.messages.file
        File resourceBoundle = grailsApplication.config.eshop.messages.boundle

        List<String> lines = messagesFile.readLines()
        List<String> resourceBoundles = resourceBoundle.readLines()
        def keys=resourceBoundles.collect {
            if(it.contains("="))
                it.substring(0,it.indexOf("="))
            else
                ""
        }
        messagesFile.write(lines.minus(keys).unique().sort().join("\n"))
    }
}
