package eshop

import grails.plugin.cache.CacheEvict



class CacheCleanerJob {
    static triggers = {
        simple repeatInterval: 120000 // execute job once in 2 minutes
    }

    @CacheEvict(value = 'service', allEntries = true)
    def execute() {
        println 'All Service Cache Cleared: ' + new Date()
    }
}
