package eshop

import grails.plugin.cache.util.ClassUtils
import org.codehaus.groovy.grails.web.pages.GroovyPageTemplate
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsWebRequest
import org.springframework.web.context.request.RequestContextHolder

class CacheTagLib {

    static namespace = 'ehcache'

    def grailsCacheManager
    def groovyPagesTemplateRenderer
    /**
     * Renders a GSP template and caches the result so the next time the same template
     * is rendered, it does not need to be evaluated again.
     *
     * @attr template REQUIRED The name of the template to apply
     * @attr key An optional cache key allowing the same template to be cached with different content
     * @attr contextPath the context path to use (relative to the application context path). Defaults to "" or path to the plugin for a plugin view or template.
     * @attr bean The bean to apply the template against
     * @attr model The model to apply the template against as a java.util.Map
     * @attr collection A collection of model objects to apply the template to
     * @attr var The variable name of the bean to be referenced in the template
     * @attr plugin The plugin to look for the template in
     */
    def renderShortTTL = { attrs ->
        def key = calculateFullKey(attrs.template, attrs.contextPath, attrs.plugin)
        if (attrs.key) {
            key = key + ':' + attrs.key
        }

        def cache = grailsCacheManager.getCache('grailsTemplatesShortTTLCache')
        def content = cache.get(key)
        if (content == null) {
            content = g.render(attrs)
            cache.put(key, content)
        } else {
            content = content.get()
        }
        out << content
    }

    def render = { attrs ->
        def key = calculateFullKey(attrs.template, attrs.contextPath, attrs.plugin)
        if (attrs.key) {
            key = key + ':' + attrs.key
        }

        def cache = grailsCacheManager.getCache('grailsTemplatesNormalCache')
        def content = cache.get(key)
        if (content == null) {
            content = g.render(attrs)
            cache.put(key, content)
        } else {
            content = content.get()
        }
        out << content
    }

    def renderLongTTL = { attrs ->
        def key = calculateFullKey(attrs.template, attrs.contextPath, attrs.plugin)
        if (attrs.key) {
            key = key + ':' + attrs.key
        }

        def cache = grailsCacheManager.getCache('grailsTemplatesLongTTLCache')
        def content = cache.get(key)
        if (content == null) {
            content = g.render(attrs)
            cache.put(key, content)
        } else {
            content = content.get()
        }
        out << content
    }

    protected String calculateFullKey(String templateName, String contextPath, String pluginName) {
        GrailsWebRequest webRequest = RequestContextHolder.currentRequestAttributes()
        String uri = webRequest.attributes.getTemplateUri(templateName, webRequest.request)

        GroovyPageTemplate t = groovyPagesTemplateRenderer.findAndCacheTemplate(
                webRequest, pageScope, templateName, contextPath, pluginName, uri)
        if (!t) {
            throwTagError("Template not found for name [$templateName] and path [$uri]")
        }

        t.metaInfo.pageClass.name
    }
}
