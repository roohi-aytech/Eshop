package eshop

import eshop.tracking.*
import org.springframework.web.context.request.RequestContextHolder

class TrackingService {

    def springSecurityService
    def userAgentIdentService

    def trackExplore(ProductType productType = null, List<Brand> brands = new ArrayList<Brand>()) {
        def trackingLog = new ExploreTrackingLog()
        fillGeneralTrackingLog(trackingLog)
        trackingLog.productType = productType
        brands.each { trackingLog.addToBrands(it) }
        trackingLog.referrerUrl = RequestContextHolder.currentRequestAttributes().request.getHeader("referer")
        trackingLog.save()
    }

    def trackProductVisit(Product product) {
        def trackingLog = new ProductVisitTrackingLog()
        fillGeneralTrackingLog(trackingLog)
        trackingLog.product = product
        trackingLog.referrerUrl = RequestContextHolder.currentRequestAttributes().request.getHeader("referer")
        trackingLog.save()
    }

    def trackSearch(ProductType productType, List<Brand> brands = new ArrayList<Brand>(), String phrase) {
        def trackingLog = new SearchTrackingLog()
        fillGeneralTrackingLog(trackingLog)
        trackingLog.productType = productType
        brands.each { trackingLog.addToBrands(it) }
        trackingLog.phrase = phrase
        trackingLog.referrerUrl = RequestContextHolder.currentRequestAttributes().request.getHeader("referer")
        trackingLog.save()
    }

    def trackSignIn() {
        def trackingLog = new SignInTrackingLog()
        fillGeneralTrackingLog(trackingLog)
        trackingLog.save()
    }

    def trackSignOut() {
        def trackingLog = new SignOutTrackingLog()
        fillGeneralTrackingLog(trackingLog)
        trackingLog.save()
    }

    def fillGeneralTrackingLog(TrackingLog trackingLog) {
        def request = RequestContextHolder.currentRequestAttributes().getRequest()
        trackingLog.ipAddress = request.getRemoteAddr()
        try {
            trackingLog.browserName = userAgentIdentService.browserName
            trackingLog.browserVersion = userAgentIdentService.browserVersion
            trackingLog.operatingSystem = userAgentIdentService.operatingSystem
        } catch (ex) {}
        if (springSecurityService.loggedIn
                && springSecurityService.currentUser instanceof Customer)
            trackingLog.customer = springSecurityService.currentUser as Customer
        trackingLog.date = new Date()
    }

}
