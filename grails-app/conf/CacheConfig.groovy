
/**
 * Created with IntelliJ IDEA.
 * User: root
 * Date: 9/9/13
 * Time: 11:57 PM
 * To change this template use File | Settings | File Templates.
 */

grails.cache.config = {

    cache {
        name 'grailsTemplatesShortTTLCache'
        maxElementsInMemory 10000
        eternal false
        timeToIdleSeconds 120
        timeToLiveSeconds 120
        overflowToDisk true
        maxElementsOnDisk 10000000
        diskPersistent false
        diskExpiryThreadIntervalSeconds 120
        memoryStoreEvictionPolicy 'LRU'
    }
    cache {
        name 'grailsTemplatesNormalCache'
        maxElementsInMemory 10000
        eternal false
        timeToIdleSeconds 7200
        timeToLiveSeconds 7200
        overflowToDisk true
        maxElementsOnDisk 10000000
        diskPersistent false
        diskExpiryThreadIntervalSeconds 7200
        memoryStoreEvictionPolicy 'LRU'
    }
    cache {
        name 'grailsTemplatesLongTTLCache'
        maxElementsInMemory 10000
        eternal false
        timeToIdleSeconds 86400
        timeToLiveSeconds 86400
        overflowToDisk true
        maxElementsOnDisk 10000000
        diskPersistent false
        diskExpiryThreadIntervalSeconds 86400
        memoryStoreEvictionPolicy 'LRU'
    }
    cache {
        name 'grailsBlocksTemporaryCache'
        eternal false
        overflowToDisk true
        maxElementsInMemory 10000
        maxElementsOnDisk 10000000
    }

    cache {
        name 'layout'
        eternal false
        overflowToDisk true
        maxElementsInMemory 10000
        maxElementsOnDisk 10000000
    }

    cache {
        name 'action'
        eternal false
        overflowToDisk true
        maxElementsInMemory 10000
        maxElementsOnDisk 10000000
    }

    cache {
        name 'service'
        eternal false
        overflowToDisk true
        maxElementsInMemory 10000
        maxElementsOnDisk 10000000
    }
}
