import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.springframework.security.core.Authentication
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices

class LogoutController {

    def springSecurityService
    /**
     * Index action. Redirects to the Spring security logout uri.
     */
    def index = {
        // TODO put any pre-logout code here
        if(params.forwardUri)
        {
            Authentication auth = SecurityContextHolder.context.authentication
            new SecurityContextLogoutHandler().logout(request, response, auth);
            new PersistentTokenBasedRememberMeServices().logout(request, response, auth);

            def url = params.forwardUri
            url = url.replace(request.contextPath, "")
            redirect url: url
        }
        else
            redirect uri: SpringSecurityUtils.securityConfig.logout.filterProcessesUrl // '/j_spring_security_logout'
    }
}
