package eshop

class MongoJob {

    def mongoService

    def startDelay = 1000
    def timeout = 1000

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
            withHttp(uri: "http://local.zanbil.ir") {
                def result = get(path : "/site/synchMongoItem/${product.first()}")
                println("Synchronizing: ${product.first()}, result: ${result}")
            }
//            try{
//            mongoService.storeProduct(Product.get(product.first()))
//                println("Synchronized: ${product.first()}")
//            }
//            catch(ex){
//                ex.printStackTrace()
//                println("Failed to Synchronize: ${product.first()}")
//            }
        } else {
            println('No Product to Synchronize')
        }
    }
}
