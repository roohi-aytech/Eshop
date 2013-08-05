package eshop

class Customer extends User {
    static auditable = true

    String sex
    Date birthDate
    String nationalCode
    String jobTitle
    String telephone
    String mobile
    String favoriteStyle
    Address address
    Customer reagent
    String wayOfKnowing

    String registrationLevel = 'basic'
    Boolean profilePersonalInfoFilled = false
    Boolean profileReagentFilled = false
    Boolean profileFavoritesFilled = false
    Boolean profileNewsLettersFilled = false
    Boolean favoritesFilled = false


    static hasMany = [wishList:Product, newsLetterCategories: NewsLetterCategory, newsLetterProductTypes: ProductType, favoriteProductTypes: ProductType, personalEvents: PersonalEvent]

    static constraints = {
        sex(nullable:true, inList: ['female', 'male'])
        birthDate(nullable:true,persian: true)
        nationalCode(nullable:true)
        jobTitle(nullable:true, inList: ['official', 'technical', 'self-employment', 'athlete', 'military', 'student', 'collegian', 'other'])
        telephone(nullable: true)
        mobile(nullable: true)
        favoriteStyle nullable: true, inList: ['traditional', 'classic', 'modern']
        address(nullable: true)
        registrationLevel(nullable: true, inList: ['basic', 'profile', 'full'])
        profilePersonalInfoFilled(nullable: true)
        profileReagentFilled(nullable: true)
        profileFavoritesFilled(nullable: true)
        profileNewsLettersFilled(nullable: true)
        favoritesFilled(nullable: true)
        wayOfKnowing nullable: true, inList: ['friends', 'search-engines', 'websites', 'news', 'email', 'advertisements', 'other']
        reagent nullable:true
    }
}
