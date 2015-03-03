package eshop.invitation

import grails.converters.deep.JSON
import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH
import org.scribe.builder.ServiceBuilder
import org.scribe.builder.api.FacebookApi
import org.scribe.model.OAuthRequest
import org.scribe.model.Verb
import org.scribe.model.Verifier

class FacebookInvitationService{

    static transactional = true
    static def authService
    static def messageAttrs = [ 'message', 'picture', 'link', 'name', 'caption', 'description', 'source' ]
    static def useEmail = false

    def getAuthDetails( callbackUrl ){
        if(!authService){
            authService = new ServiceBuilder().provider( FacebookApi.class)
                    .apiKey( CH.config.grails.plugin.invitation.facebook.key as String )
                    .apiSecret( CH.config.grails.plugin.invitation.facebook.secret as String )
                    .scope( 'publish_stream' )
                    .callback( callbackUrl as String ).build()
        }
        [ authUrl : authService.getAuthorizationUrl( null  ), requestToken : null ]
    }

    def getAccessToken( params, requestToken ){
        Verifier verifier = new Verifier( params.code as String );
        authService.getAccessToken( null, verifier );
    }

    def getContacts( accessToken ){

        OAuthRequest request = new OAuthRequest( Verb.GET, 'https://graph.facebook.com/me/friends/' );
        authService.signRequest( accessToken, request )
        def response = request.send();

        def contacts = []

        JSON.parse( response.body ).data.each{

            def contact = [ : ]
            contact.name = it.name
            contact.address = it.id
            contact.photo = "http://graph.facebook.com/${ it.id }/picture"
            contacts << contact

        }

        contacts.sort { it.name.toLowerCase() }

    }

    def sendMessage = { attrs ->

        OAuthRequest request = new OAuthRequest( Verb.POST, "https://graph.facebook.com/${ attrs.contact }/feed" )

        request.addBodyParameter( 'message', attrs.message )
        request.addBodyParameter( 'link', attrs.link )

        if( attrs.picture )
            request.addBodyParameter( 'picture', attrs.picture )

        if( attrs.name )
            request.addBodyParameter( 'name', attrs.name )

        if( attrs.caption )
            request.addBodyParameter( 'caption', attrs.caption )

        if( attrs.description )
            request.addBodyParameter( 'description', attrs.description )

        if( attrs.source )
            request.addBodyParameter( 'source', attrs.source )

        authService.signRequest( attrs.accessToken, request )

        return request.send()

    }

}
