package eshop



class NewsLetterJob {

    def mailService

    static triggers = {
    }

    def execute(params) {
        def newsLetter = params.jobDataMap.newsLetter as NewsLetter

        def customerList = Customer.createCriteria().list {
            or {
                newsLetterCategories {
                    'in'('id', newsLetter.categories.collect { it.id } ?: [0.toLong()])
                }
                newsLetterProductTypes {
                    'in'('id', newsLetter.productTypes.collect { it.id } ?: [0.toLong()])
                }
            }
        }

        customerList.each { customer ->
            println(customer)
            mailService.sendMail {
                to customer.email
                subject newsLetter.subject
                html newsLetter.body
            }
            Thread.sleep(5000)
        }
    }
}
