package eshop

import eshop.discout.ExternalDiscount
import eshop.discout.ExternalDiscountDifinition
import groovyx.net.http.HTTPBuilder


class TakhfifyabJob {
    static concurrent = false
    def grailsApplication
    def messageService
    static triggers = {
        simple repeatInterval: 120000l // execute job once in 120 seconds
    }

    def execute() {
        readData()
    }

    def readData() {
        println 'Reading Takhfifyab'
        if (grailsApplication.config.eShop.instance == 'goldaan') {
            def tkhf = new Takhfifyab()
            ExternalDiscountDifinition.findAllByType('takhfifyab').each { ddef ->
                def serials = tkhf.getDeals(ddef.externalId)
                serials.each {
                    if (it) {
                        if (!ExternalDiscount.countBySerial(it)) {
                            new ExternalDiscount(serial: it, externalDiscountDifinition: ddef, createDate: new Date()).save()
                            def product = ddef.model.product
                            def name = "${product?.manualTitle ? product?.pageTitle : product?.title} (${it})"
                            Thread.start {
                                def adminNotifiers = grailsApplication.config.orderCreateNotifiers
                                println name
                                adminNotifiers.split(',').each {
                                    messageService.sendMessage(
                                            it,
                                            'یکی ' + name + ' خریدا')
                                }
                            }

                        }
                    }
                }

            }

//            def hb = new HTTPBuilder('http://www.takhfifyab.ir')
//            hb.get(path: '/login') { resp, data ->
//                println 'Reading Takhfifyab'
//                if (resp.statusLine.statusCode == 200) {
//                    def form = data.depthFirst().find { it.'@id' == 'new_user_session' }
//                    def utf8 = form.depthFirst().find { it.'@name' == 'utf8' }.@value
//                    def authenticity_token = form.depthFirst().find { it.'@name' == 'authenticity_token' }.@value
//
//                    hb.post(path: form.'@action', body: [utf8: utf8, authenticity_token: authenticity_token, 'user_session[email]': 'narges.aghabeigi@gmail.com', 'user_session[password]': 'narges5593']) { resp2, data2 ->
//                        if (resp2.statusLine.statusCode == 302) {
//                            ExternalDiscountDifinition.findAllByType('takhfifyab').each { ddef ->
//                                hb.get(path: "/deals/${ddef.externalId}/vouchers") { resp3, data3 ->
//                                    if (resp3.statusLine.statusCode == 200) {
//                                        def serials = data3?.depthFirst()?.find {
//                                            it.'@class' == 'table_type'
//                                        }?.TBODY?.TR?.collect()?.collate(3)?.collect { it?(it[1]?.TD[1]?.text()):'' }
//                                        serials.each {
//                                            if(it) {
//                                                if(!ExternalDiscount.countBySerial(it)) {
//                                                    new ExternalDiscount(serial: it, externalDiscountDifinition: ddef, createDate: new Date()).save()
//                                                    def product=ddef.model.product
//                                                    def name="${product?.manualTitle ? product?.pageTitle : product?.title} (${it})"
//                                                    Thread.start {
//                                                        def adminNotifiers = grailsApplication.config.orderCreateNotifiers
//                                                        println name
//                                                        adminNotifiers.split(',').each {
//                                                            messageService.sendMessage(
//                                                                    it,
//                                                                    'یکی '+name+' خریدا')
//                                                        }
//                                                    }
//
//                                                }
//                                            }
//                                        }
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }
//
//            }
        }
    }

}
