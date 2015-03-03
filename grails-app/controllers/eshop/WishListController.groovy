package eshop

class WishListController {

    def springSecurityService

    def add() {
        def id = params.id
        def product = Product.get(id)

        def user = springSecurityService.currentUser
        if (!(user && user instanceof Customer)){
            render "not-logged-in"
            return
        }

        def customer = Customer.findByUsername(((User)user).username)
        if (!customer.wishList)
            customer.wishList = [];
        def wishListItem = customer.wishList.find { it -> it.id == id.toInteger() }
        if (!wishListItem)
            customer.wishList.add(product)

        if (!customer.validate() || !customer.save()) {
            render customer.errors.toString()
            return
        }

        render "1"
    }

    def remove() {
        def id = params.id as Long

        def user = springSecurityService.currentUser
        if (!(user && user instanceof Customer)){
            render "not-logged-in"
            return
        }

        def customer = Customer.findByUsername(((User)user).username)
        if (!customer.wishList || customer.wishList.isEmpty())
            render "basket is empty";
        customer.wishList = customer.wishList.findAll { it -> !(it.id == id) }

        if (!customer.validate() || !customer.save()){
            render customer.errors.toString()
            return
        }

        render "1"
    }

    def show(){
        if(session.mobile)
            render view: 'showMobile'
        else
            render view: 'show'
    }
}
