package eshop

import groovy.text.Template

class InvitationTagLib {

    static namespace="iv"

    def invitationLink = { attrs, body ->

        if (!attrs.provider) {
            throwTagError("Tag [invitationLink] is missing required attribute [provider]")
        }
        if(grailsApplication.config.grails.plugin.invitation[attrs.provider]?.enabled) {
            def action = (attrs.boolean('pick') ? 'pick' : 'invite')
            def linkAttrs = [controller: 'invitation', action: action, params: [provider: attrs.provider]]

            out << link(linkAttrs, body)
        }
    }

    def messageForm = { attrs ->

        out << render( template: '/invitation/invitationForm', model: attrs, plugin:'invitation' )

    }

    def contacts = { attrs ->

        out << render( template: '/invitation/contacts', model: [contacts: attrs.contacts ], plugin:'invitation' )

    }

    def pickForm = { attrs ->
        if (!attrs.controller || !attrs.action) {
            throwTagError("Tag [pickForm] is missing required attribute [controller] or [action]")
        }
        out << render( template: '/invitation/pickForm', model: attrs, plugin:'invitation' )

    }
}
