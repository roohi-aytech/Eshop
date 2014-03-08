package eshop

import grails.plugin.cache.CacheEvict


class CacheCleanerJob {
    static triggers = {
        simple repeatInterval: 120000 // execute job once in 2 minutes
    }


    def execute() {
        clearFeed()
        clearNews()
        clearImage()
        clearService()
        clearPosts()
    }

    @CacheEvict(value = 'service', allEntries = true)
    def clearService() {
        println 'All Service Cache Cleared: ' + new Date()
    }

    @CacheEvict(value = 'imageindex', allEntries = true)
    def clearImage() {
        println 'All Image Cache Cleared: ' + new Date()
    }

    @CacheEvict(value = 'feedatricles', allEntries = true)
    def clearFeed() {
        println 'All Feed Cache Cleared: ' + new Date()
    }

    @CacheEvict(value = 'feedposts', allEntries = true)
    def clearPosts() {
        println 'All Post Cache Cleared: ' + new Date()
    }

    @CacheEvict(value = 'feednews', allEntries = true)
    def clearNews() {
        println 'All News Cache Cleared: ' + new Date()
    }

}
