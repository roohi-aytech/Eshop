package eshop

import eshop.tracking.SearchTrackingLog
import grails.plugins.springsecurity.Secured

class SiteMapController {

    @Secured([RoleHelper.ROLE_USER_ADMIN])
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

                //login
                url {
                    loc(g.createLink(absolute: true, controller: 'login'))
                    changefreq(SiteMapHelper.CHANGE_FREQUENCY_NEVER)
                    priority(0.1)
                }
                url {
                    loc(g.createLink(absolute: true, controller: 'customer', action: 'register'))
                    changefreq(SiteMapHelper.CHANGE_FREQUENCY_NEVER)
                    priority(0.1)
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

    def images() {
        render(contentType: 'text/xml', encoding: 'UTF-8') {
            mkp.yieldUnescaped '<?xml version="1.0" encoding="UTF-8"?>'
            urlset(xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9",
                    'xmlns:image': "http://www.google.com/schemas/sitemap-image/1.1") {
                Product.findAllByIsVisible(true).each { product ->
                    url {
                        loc(g.createLink(absolute: true, uri: "/product/${product.id}"))
                        product.images.each { image ->
                            'image:image' {
                                'image:loc'(g.createLink(absolute: true, controller: 'image', params:[id: product?.id, name: image?.name, wh: 'max']))
                                'image:caption'(image.name)
                                'image:title'(product.manualTitle ? product.pageTitle : product.toString())
                            }
                        }
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
                def phraseList = SearchTrackingLog.createCriteria().list {
                    isNotNull('phrase')
                    notEqual('phrase', '')
                    projections {
                        groupProperty "phrase"
                        count "id", 'searchCount'

                    }
                    order('searchCount', 'desc')
                }

                phraseList.each { searchTrackingLog ->
                    url {
                        loc(g.createLink(absolute: true, controller: 'site', action: 'search', params: [f: 'p0', phrase: searchTrackingLog[0]]))
                        changefreq(SiteMapHelper.CHANGE_FREQUENCY_MONTHLY)
                        priority(0.5)
                    }
                }
            }
        }
    }

    def articles() {
        render(contentType: 'text/xml', encoding: 'UTF-8') {
            mkp.yieldUnescaped '<?xml version="1.0" encoding="UTF-8"?>'
            urlset(xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9",
                    'xmlns:xsi': "http://www.w3.org/2001/XMLSchema-instance",
                    'xsi:schemaLocation': "http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd") {
                JournalArticle.findAll().each { article ->
                    url {
                        loc(g.createLink(absolute: true, uri: "/article/${article.id}"))
                        changefreq(SiteMapHelper.CHANGE_FREQUENCY_YEARLY)
                        priority(0.6)
                    }
                }
            }
        }
    }
}
