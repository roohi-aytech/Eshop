package eshop
import groovyx.net.http.HTTPBuilder
import static groovyx.net.http.Method.GET
import static groovyx.net.http.Method.POST
import static groovyx.net.http.ContentType.JSON
/**
 * Created by roohi on 2/8/15.
 */
class Takhfifyab {
    def getDeals(dealId){
        def http = new HTTPBuilder('http://www.takhfifyab.ir')
        http.request(GET,JSON) { req ->
            uri.path = "/api/deals/${dealId}/vouchers.json"
            headers.'token' = '30772ae0-af30-11e4-9822-12e3f512a338'

            response.success = { resp, reader ->
//                println reader
                return reader.findAll{it.status=='new'}.collect{it.serial}
            }

            // called only for a 404 (not found) status code:
            response.'401' = { resp ->
                println 'Not found'
            }
        }
    }
    def submitDeal(serial,code){
        def http = new HTTPBuilder('http://www.takhfifyab.ir')
        http.request(POST,JSON) { req ->
            uri.path = "/api/vouchers/${serial}/code.json"
            headers.'token' = '30772ae0-af30-11e4-9822-12e3f512a338'
            body =  [code: code]
            response.success = { resp, reader ->
                if(reader.status=='new')
                    return true
            }

            // called only for a 404 (not found) status code:
            response.'401' = { resp,data ->
                println data.message
                return false
            }
            response.'406' = { resp,data ->
                if(data.message=='already used'){
                    println 'used'
                    return true
                }
                else{
                    println data.message
                    return false
                }

            }
        }
        return false
    }

}
