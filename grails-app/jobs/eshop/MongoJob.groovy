package eshop

import java.lang.management.GarbageCollectorMXBean

class MongoJob {

    def mongoService
    def grailsApplication

    def startDelay = 60000
    def timeout = 2000

    def execute() {
        def product = Product.createCriteria().list(max: 1) {
            or {
                eq('isSynchronized', false)
                isNull('isSynchronized')
            }
            or {
                eq('deleted', false)
                isNull('deleted')
            }
            projections {
                property('id', 'id')
            }
        }
        if (product.size() > 0) {
            withHttp(uri: grailsApplication.config.grails.serverURL ?: 'http://localhost') {
                try {
                    def result = get(path: "/site/synchMongoItem/${product.first()}")
                    println("Synchronizing: ${product.first()}, result: ${result}")
                }
                catch(ex) {
                    ex.printStackTrace()
                    println("Synchronizing: ${product.first()}, result: -2")
                }
            }
        } else {
            println('No Product to Synchronize')
        }
    }
}