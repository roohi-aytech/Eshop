package eshop;

import grails.plugin.cache.web.filter.DefaultWebKeyGenerator;
import org.codehaus.groovy.grails.web.util.WebUtils;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by roohi on 3/9/14.
 */
public class EShopWebKeyGenerator extends DefaultWebKeyGenerator {
    @Override
    public String generate(HttpServletRequest request) {
        String uri = WebUtils.getForwardURI(request);

        StringBuilder key = new StringBuilder();
        key.append(request.getMethod().toUpperCase());

        String format = WebUtils.getFormatFromURI(uri);
        if (StringUtils.hasLength(format) && !"all".equals(format)) {
            key.append(":format:").append(format);
        }
        for (String key_ : request.getParameterMap().keySet()) {
            key.append(":");
            key.append(key_);
            key.append("=");
            key.append(request.getParameter(key_));
        }

        if (supportAjax) {
            String requestedWith = request.getHeader(X_REQUESTED_WITH);
            if (StringUtils.hasLength(requestedWith)) {
                key.append(':').append(X_REQUESTED_WITH).append(':').append(requestedWith);
            }
        }

        key.append(':').append(uri);
        if (StringUtils.hasLength(request.getQueryString())) {
            key.append('?').append(request.getQueryString());
        }
//        System.out.println(key.toString());
        return key.toString();
    }
}
