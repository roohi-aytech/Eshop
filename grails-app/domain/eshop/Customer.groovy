package eshop

class Customer extends User {

    String sex
    Date birthDate
    String nationalCode
    String jobTitle
    String telephone
    String mobile
    Address address


    static hasMany = [wishList:Product]

    static constraints = {
        sex(nullable:true, inList: ['female', 'male'])
        birthDate(nullable:true,persian: true)
        nationalCode(nullable:true)
        jobTitle(nullable:true)
        telephone(nullable: true)
        mobile(nullable: true)
        address(nullable: true)
    }
}
