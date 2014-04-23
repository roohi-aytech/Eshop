import eshop.EShopWebKeyGenerator
import eshop.FelfelPdfService
import eshop.ZanbilPdfService
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler

// Place your Spring DSL code here
beans = {


    if (grailsApplication.config.eShop.instance == 'felfel') {
        pdfService(FelfelPdfService) { bean -> bean.autowire = 'byName' }
    }
    else if (grailsApplication.config.eShop.instance == 'zanbil') {
        pdfService(ZanbilPdfService) { bean -> bean.autowire = 'byName' }
    }


    jmsConnectionFactory(org.apache.activemq.ActiveMQConnectionFactory) {
        brokerURL = 'vm://localhost'
    }

    securityContextLogoutHandler(SecurityContextLogoutHandler) {
        invalidateHttpSession = false
    }

    webCacheKeyGenerator(EShopWebKeyGenerator)
}
