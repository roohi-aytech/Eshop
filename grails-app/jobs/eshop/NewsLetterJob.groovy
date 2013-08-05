package eshop

import groovy.time.TimeCategory



class NewsLetterJob {

    def mailService

    static triggers = {
    }

    def execute(params) {
        def newsLetterInstance = NewsLetterInstance.get((params.jobDataMap.newsLetterInstance as NewsLetterInstance).id)
        if (newsLetterInstance.status == 'scheduled') {
            newsLetterInstance.logs?.clear()
            Customer.createCriteria().list {
                or {
                    newsLetterCategories {
                        'in'('id', newsLetterInstance.newsLetter.categories.collect { it.id } ?: [0.toLong()])
                    }
                    newsLetterProductTypes {
                        'in'('id', newsLetterInstance.newsLetter.productTypes.collect { it.id } ?: [0.toLong()])
                    }
                }
            }.unique {it.id}.each { customer ->
                def log = new NewsLetterLog()
                log.status = 'scheduled'
                log.newsLetterInstance = newsLetterInstance
                log.customer = customer
                log.save()

                newsLetterInstance.addToLogs(log)
            }
            newsLetterInstance.status = 'started'
            newsLetterInstance.save()
        }

        def newsLetterLog = NewsLetterLog.findByNewsLetterInstanceAndStatus(newsLetterInstance, 'scheduled')
        if (newsLetterLog) {
            newsLetterLog.sendDate = new Date()
            try {
                mailService.sendMail {
                    to newsLetterLog.customer.email
                    subject newsLetterInstance.newsLetter.subject
                    html newsLetterInstance.newsLetter.body
                }
                newsLetterLog.status = 'sent'
            }
            catch (exception) {
                newsLetterLog.status = 'error'
                newsLetterLog.errorMessage = exception.message
                newsLetterLog.stackTrace = exception.stackTrace
            }
            newsLetterLog.save()

            use(TimeCategory) {
                schedule(new Date() + 5.second, [newsLetterInstance: newsLetterInstance])
            }
        } else {
            newsLetterInstance.finishDate = new Date()
            newsLetterInstance.status = 'finished'
            newsLetterInstance.save()
        }
    }
}
