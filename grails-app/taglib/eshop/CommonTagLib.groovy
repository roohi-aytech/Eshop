package eshop

class CommonTagLib {

    static namespace = "common"

    def loginLink = {attrs, body ->

        out << '<a'
        out << ' href=\"' + createLink(controller: 'Login', params:['forwardUri':request.forwardURI]) + '\"'
        attrs.each { key, value ->
            out << ' ' + key + '=\"' + value + "\""
        }
        out << '>'
        out <<  message(code:'login')
        out << '</a>'
    }

    def registerLink = {attrs, body ->

        out << '<a'
        out << ' href=\"' + createLink(controller: 'Customer', action: 'register', params:['forwardUri':request.forwardURI]) + '\"'
        attrs.each { key, value ->
            out << ' ' + key + '=\"' + value + "\""
        }
        out << '>'
        out <<  message(code:'register')
        out << '</a>'
    }

    def logoutLink = {attrs, body ->

        out << '<a'
        out << ' href=\"' + createLink(controller: 'Logout') + '\"'
        attrs.each { key, value ->
            out << ' ' + key + '=\"' + value + "\""
        }
        out << '>'
        out <<  message(code:'logout')
        out << '</a>'
    }

}
