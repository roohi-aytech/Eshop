package eshop

class Customer extends User {
    static auditable = true

    String sex
    Date birthDate
    String nationalCode
    String jobTitle
    String telephone
    String mobile
    Address address
    Customer reagent

    String registrationLevel = 'basic'
    Boolean profilePersonalInfoFilled = false
    Boolean profileSendingAddressFilled = false


    static hasMany = [wishList:Product, newsLetterCategories: NewsLetterCategory, newsLetterProductTypes: ProductType]

    static constraints = {
        sex(nullable:true, inList: ['female', 'male'])
        birthDate(nullable:true,persian: true)
        nationalCode(nullable:true)
        jobTitle(nullable:true)
        telephone(nullable: true)
        mobile(nullable: true)
        address(nullable: true)
        registrationLevel(nullable: true, inList: ['basic', 'profile', 'favorites'])
        profilePersonalInfoFilled(nullable: true)
        profileSendingAddressFilled(nullable: true)
        reagent nullable:true
    }
}
