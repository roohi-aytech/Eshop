package eshop

class MakeupMessageCodesController {

    def index() {
        File messagesFile = grailsApplication.config.eshop.messages.file
        List<String> lines = messagesFile.readLines()
        messagesFile.write(lines.unique().sort().join("\n"))
    }
}
