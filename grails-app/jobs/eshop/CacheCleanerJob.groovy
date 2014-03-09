package eshop

import grails.plugin.cache.CacheEvict


class CacheCleanerJob {
    static triggers = {
        simple repeatInterval: 120000 // execute job once in 2 minutes
    }

    @CacheEvict(value = ['service', 'imageindex', 'feedatricles', 'feedposts',
    'feednews', 'pservice,', 'pmservice', 'pmmservice',
    'advservice'], allEntries = true)
    def execute() {
        println 'All Cache Cleared: ' + new Date()
    }
}
