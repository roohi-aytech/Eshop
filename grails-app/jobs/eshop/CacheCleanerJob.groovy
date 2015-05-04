package eshop

import grails.plugin.cache.CacheEvict


class CacheCleanerJob {
    static triggers = {
        simple repeatInterval: 300000 // execute job once in 2 minutes
    }

    @CacheEvict(value = ['service', 'imageindex', 'feedatricles', 'feedposts',
    'bpservice','bprservice',
    'feednews', 'pservice,', 'pmservice', 'pmmservice', 'poservice,', 'pmoservice', 'pmmoservice',
    'advservice'], allEntries = true)
    def execute() {
        println 'All Cache Cleared: ' + new Date()
    }
}
