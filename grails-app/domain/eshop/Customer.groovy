package eshop

class Customer extends User {
    Address sendingAddress;
    Address billingAddress;

    String mobile;
    String telephone;

    static hasMany = [wishList:Product]

    static constraints = {
        sendingAddress(nullable: false)
        billingAddress()
    }
}
