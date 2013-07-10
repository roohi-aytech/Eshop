package eshop



class NewsLetterJob {
    static triggers = {
    }

    def execute(params) {
        def newsLetter = params.jobDataMap.newsLetter as NewsLetter

        def customerList = Customer.createCriteria().list {
            or {
                newsLetterCategories {
                    'in'(id, newsLetter.categories.collect { it.id })
                }
                newsLetterProductTypes {
                    'in'(id, newsLetter.productTypes.collect { it.id })
                }
            }
        }
        customerList.each { customer ->
            println(customer)
        }
    }

}
