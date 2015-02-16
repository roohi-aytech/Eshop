package eshop.invitation

import grails.converters.deep.JSON
import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH
import org.scribe.builder.ServiceBuilder
import org.scribe.builder.api.YahooApi
import org.scribe.model.OAuthRequest
import org.scribe.model.Token
import org.scribe.model.Verb
import org.scribe.model.Verifier

class YahooInvitationService {

    static transactional = true
    static def authService
    static useEmail = true

    def getAuthDetails(callbackUrl) {
        if (!authService) {

            authService = new ServiceBuilder()
                    .provider(YahooApi.class)
                    .apiKey( CH.config.grails.plugin.invitation.yahoo.key as String )
                    .apiSecret( CH.config.grails.plugin.invitation.yahoo.secret as String )
                    .callback( callbackUrl as String )
                    .build();
        }

        Token requestToken = authService.getRequestToken();

        [ authUrl : authService.getAuthorizationUrl(requestToken), requestToken : requestToken ]

    }

    def getAccessToken( params, requestToken ){
        requestToken = requestToken as Token
        Verifier verifier = new Verifier( params.oauth_verifier )
        authService.getAccessToken(requestToken, verifier);
    }

    def getContacts(accessToken) {

        def friends = sendRequest( accessToken, Verb.GET, "http://social.yahooapis.com/v1/user/me/contacts?format=json" ).contacts.contact

        def contacts = []
        def addedContact = []

        friends.each{ friendJSON ->

            def contact = [:]


            friendJSON.fields.each{ field->
                if( field.type == 'email' ){
                    contact.address = "${field.value}"
                }

                if( field.type == 'name'){
                    contact.name = "${ field.value.givenName?:'' } ${ field.value.familyName?:'' }"
                }

                if( contact.address && !addedContact.contains( contact.address )){
                    contacts << contact
                    addedContact << contact.address
                }
            }
        }

        contacts.sort { it.name?.toLowerCase() }

    }

    private def sendRequest( accessToken, method, url ){
        OAuthRequest request = new OAuthRequest( method, url )
        authService.signRequest( accessToken, request )
        def response = request.send();
        return JSON.parse( response.body )
    }

}