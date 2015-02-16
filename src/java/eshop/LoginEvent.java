package eshop;

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by root on 9/7/14.
 */
public class LoginEvent extends SavedRequestAwareAuthenticationSuccessHandler {

    @Override
    protected String determineTargetUrl(HttpServletRequest request,
                                        HttpServletResponse response) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();

        if ("admin".equals(username))
            return "/admin";
        if (request.getParameterMap().containsKey("redirectURL"))
            return request.getParameter("redirectURL");
        return super.determineTargetUrl(request, response);
    }
}
