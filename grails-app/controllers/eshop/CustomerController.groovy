package eshop

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.Authentication
import org.springframework.security.core.authority.AuthorityUtils
import org.springframework.security.core.context.SecurityContextHolder

class CustomerController {

    def springSecurityService

    def index() {}

    def panel(){}

    def changePassword(){
    }

    def saveNewPassword(){
        def user = (User)springSecurityService.currentUser
        if(user.password == springSecurityService.encodePassword(params.oldPassword)){
            if (params.newPassword.trim() != '')
            {
                if (params.newPassword == params.confirmPassword)
                {
                    user.password = params.newPassword
                    if(user.validate() && user.save()){
                        flash.message = message(code: "password.change.success")
                        redirect(action: 'panel')
                    }
                    else{
                        flash.message = message(code: "password.change.fail")
                        redirect(action: 'changePassword')
                    }
                }
                else{
                    flash.message = message(code: "password.change.notMatch")
                    redirect(action: 'changePassword')
                }
            }
            else{
                flash.message = message(code: "password.change.emptyPassword")
                redirect(action: 'changePassword')
            }
        }
        else{
            flash.message = message(code: "password.change.invalidPassword")
            redirect(action: 'changePassword')
        }
    }

    def register(){
//        if (params.username){
//
//            def customerInstance = new Customer()
//
//            customerInstance.username = params.username
//            customerInstance.password = params.password
//            customerInstance.firstName = params.firstName
//            customerInstance.lastName = params.lastName
//            customerInstance.email = params.email
//            customerInstance.mobile = params.mobile
//            customerInstance.telephone = params.telephone
//            customerInstance.billingAddress = new Address(addressLine1: params.billingAddress)
//            customerInstance.sendingAddress = new Address(addressLine1: params.sendingAddress)
//
//            render(view: 'register', model:['customerInstance': customerInstance])
//        }
//        else
//            render(view: 'register', model:['customerInstance': new Customer()])
        ['customerInstance': new Customer()]
    }

    def save(){
        def customerInstance = new Customer()

        customerInstance.username = params.username
        customerInstance.password = params.password
        customerInstance.firstName = params.firstName
        customerInstance.lastName = params.lastName
        customerInstance.email = params.email
        customerInstance.mobile = params.mobile
        customerInstance.telephone = params.telephone

        Address billingAddress = new Address(addressLine1: params.billingAddress)
        if (!billingAddress.validate() || !billingAddress.save()){
            flash.message = billingAddress.errors// message(code: 'register.fail')
            redirect(controller: 'customer', action: 'register', params: ['customerInstance', customerInstance])
            return
        }

        Address sendingAddress = new Address(addressLine1: params.sendingAddress)
        if (!sendingAddress.validate() || !sendingAddress.save()){
            flash.message = sendingAddress.errors// message(code: 'register.fail')
            redirect(controller: 'customer', action: 'register', params: ['customerInstance', customerInstance])
            return
        }

        customerInstance.billingAddress = (Address)billingAddress
        customerInstance.sendingAddress = (Address)sendingAddress

        customerInstance.enabled = true
        if (customerInstance.validate() && customerInstance.save())
        {
            def customerRole = Role.findByAuthority(RoleHelper.ROLE_CUSTOMER)
            UserRole.create customerInstance, customerRole

            flash.message = message(code: 'register.successful')
            redirect(controller: 'login', action: 'auth')
        }
        else{
            render(view: 'register', model:['customerInstance': customerInstance])
        }

    }
}
