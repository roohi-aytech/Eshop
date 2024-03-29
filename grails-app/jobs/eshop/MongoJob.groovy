package eshop

import groovyx.net.http.HTTPBuilder

import java.lang.management.GarbageCollectorMXBean

class MongoJob {

    def mongoService
    def grailsApplication

    static concurrent = false

    static triggers = {
        simple repeatInterval: 500, startDelay: 60000 // execute job once in 2 minutes
    }

    def execute() {
        def product = Product.createCriteria().list(max: 1) {
            or {
                eq('isSynchronized', false)
                isNull('isSynchronized')
            }
//            or {
//                eq('deleted', false)
//                isNull('deleted')
//            }
            projections {
                property('id', 'id')
            }
        }
        if (product.size() > 0) {
            def url="${(grailsApplication.config.grails.serverURL ?: 'http://localhost:8080/EShop')}/site/synchMongoItem/${product.first()}"
            def http = new HTTPBuilder(url)
            try {
                def result = http.get([:]).toString().trim()
//            withHttp(uri: grailsApplication.config.grails.serverURL ?: 'http://localhost') {
//                    def result = get(path: "/site/synchMongoItem/${product.first()}")
                println("Synchronizing: ${product.first()}, result: ${result}")
            }
            catch (ex) {
                //ex.printStackTrace()
                println("Synchronizing: ${product.first()}, result: ERROR ${ex.message}")
            }

//            }
        } else {
//            println('No Product to Synchronize')
        }
    }
}
