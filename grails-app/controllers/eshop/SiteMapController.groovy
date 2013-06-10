package eshop

import eshop.tracking.SearchTrackingLog
import grails.plugins.springsecurity.Secured

class SiteMapController {

    @Secured([RoleHelper.ROLE_PRODUCT_ADMIN])
    def index() {

    }

    def statics() {
        render(contentType: 'text/xml', encoding: 'UTF-8') {
            mkp.yieldUnescaped '<?xml version="1.0" encoding="UTF-8"?>'
            urlset(xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9",
                    'xmlns:xsi': "http://www.w3.org/2001/XMLSchema-instance",
                    'xsi:schemaLocation': "http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd") {

                //home page
                url {
                    loc(g.createLink(absolute: true, uri: "/"))
                    changefreq(SiteMapHelper.CHANGE_FREQUENCY_HOURLY)
                    priority(1.0)
                }

            }
        }
    }

    def productTypes() {
        render(contentType: 'text/xml', encoding: 'UTF-8') {
            mkp.yieldUnescaped '<?xml version="1.0" encoding="UTF-8"?>'
            urlset(xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9",
                    'xmlns:xsi': "http://www.w3.org/2001/XMLSchema-instance",
                    'xsi:schemaLocation': "http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd") {
                ProductType.findAll().each { productType ->
                    url {
                        loc(g.createLink(absolute: true, uri: "/browse/${productType.urlName}"))
                        changefreq(SiteMapHelper.CHANGE_FREQUENCY_DAILY)
                        priority(0.8)
                    }
                }
            }
        }
    }

    def products() {
        render(contentType: 'text/xml', encoding: 'UTF-8') {
            mkp.yieldUnescaped '<?xml version="1.0" encoding="UTF-8"?>'
            urlset(xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9",
                    'xmlns:xsi': "http://www.w3.org/2001/XMLSchema-instance",
                    'xsi:schemaLocation': "http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd") {
                Product.findAllByIsVisible(true).each { product ->
                    url {
                        loc(g.createLink(absolute: true, uri: "/product/${product.id}"))
                        changefreq(SiteMapHelper.CHANGE_FREQUENCY_WEEKLY)
                        priority(0.9)
                    }
                }
            }
        }
    }

    def searches() {
        render(contentType: 'text/xml', encoding: 'UTF-8') {
            mkp.yieldUnescaped '<?xml version="1.0" encoding="UTF-8"?>'
            urlset(xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9",
                    'xmlns:xsi': "http://www.w3.org/2001/XMLSchema-instance",
                    'xsi:schemaLocation': "http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd") {
                def phraseList = SearchTrackingLog.createCriteria().list{
                    isNotNull('phrase')
                    notEqual('phrase', '')
                    projections{
                        groupProperty "phrase"
                        count "id",'searchCount'

                    }
                    order('searchCount','desc')
                }

                phraseList.each { searchTrackingLog ->
                    url {
                        loc(g.createLink(absolute: true, controller: 'site', action: 'search', params:[f: 'p0', phrase:searchTrackingLog[0]]))
                        changefreq(SiteMapHelper.CHANGE_FREQUENCY_MONTHLY)
                        priority(0.5)
                    }
                }
            }
        }
    }
}
