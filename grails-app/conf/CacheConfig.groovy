
/**
 * Created with IntelliJ IDEA.
 * User: root
 * Date: 9/9/13
 * Time: 11:57 PM
 * To change this template use File | Settings | File Templates.
 */

grails.cache.config = {

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
