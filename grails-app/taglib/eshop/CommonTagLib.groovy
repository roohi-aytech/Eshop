package eshop

class CommonTagLib {

    static namespace = "common"

    def loginLink = { attrs, body ->

        out << '<a target="_self"'
        out << ' href=\"' + createLink(controller: 'Login', action: 'auth', params: ['forwardUri': request.forwardURI], absolute: true)/*.replaceFirst('http:', 'https:') */+ '\"'
        attrs.each { key, value ->
            out << ' ' + key + '=\"' + value + "\""
        }
        out << '>'
        out << message(code: 'login.link')
        out << '</a>'
    }

    def registerLink = { attrs, body ->

        out << '<a target="_self"'
        out << ' href=\"' + createLink(controller: 'Customer', action: 'register', params: ['forwardUri': request.forwardURI], absolute: true)/*.replaceFirst('http:', 'https:')*/ + '\"'
        attrs.each { key, value ->
            out << ' ' + key + '=\"' + value + "\""
        }
        out << '>'
        out << message(code: 'register.link')
        out << '</a>'
    }

    def logoutLink = { attrs, body ->

        out << '<a target="_self"'
        out << ' href=\"' + createLink(controller: 'Logout') + '\"'
        attrs.each { key, value ->
            out << ' ' + key + '=\"' + value + "\""
        }
        out << '>'
        out << message(code: 'logout')
        out << '</a>'
    }

    def link = { attrs, body ->
        if (attrs.https) {
            attrs.absolute = true
            out << g.link(attrs, body).replaceFirst('http:', 'https:')
        } else
            out << g.link(attrs, body)
    }


}
