import eshop.EShopWebKeyGenerator
import eshop.FelfelPdfService
import eshop.GoldaanPdfService
import eshop.LoginEvent
import eshop.ZanbilPdfService
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler

// Place your Spring DSL code here
beans = {


    if (grailsApplication.config.eShop.instance == 'felfel') {
        pdfService(FelfelPdfService) { bean -> bean.autowire = 'byName' }
    }
    else if (grailsApplication.config.eShop.instance == 'zanbil') {
        pdfService(ZanbilPdfService) { bean -> bean.autowire = 'byName' }
    }
    else if (grailsApplication.config.eShop.instance == 'goldaan') {
        pdfService(GoldaanPdfService) { bean -> bean.autowire = 'byName' }
    }


    jmsConnectionFactory(org.apache.activemq.ActiveMQConnectionFactory) {
        brokerURL = 'vm://localhost'
    }

    securityContextLogoutHandler(SecurityContextLogoutHandler) {
        invalidateHttpSession = false
    }
    authenticationSuccessHandler(LoginEvent) {
        def conf = SpringSecurityUtils.securityConfig
        requestCache = ref('requestCache')
        defaultTargetUrl = conf.successHandler.defaultTargetUrl
        alwaysUseDefaultTargetUrl = conf.successHandler.alwaysUseDefault
        targetUrlParameter = conf.successHandler.targetUrlParameter
        useReferer = conf.successHandler.useReferer
        redirectStrategy = ref('redirectStrategy')
    }

    webCacheKeyGenerator(EShopWebKeyGenerator)
}
