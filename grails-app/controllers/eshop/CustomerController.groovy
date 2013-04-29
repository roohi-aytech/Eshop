package eshop

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.Authentication
import org.springframework.security.core.authority.AuthorityUtils
import org.springframework.security.core.context.SecurityContextHolder

class CustomerController {

    def springSecurityService
    def mailService

    def index() {}

    def panel() {
        [customer: Customer.findByUsername(((User) springSecurityService.currentUser).username)]
    }

    def changePassword() {
    }

    def saveNewPassword() {
        def user = (User) springSecurityService.currentUser
        if (user.password == springSecurityService.encodePassword(params.oldPassword)) {
            if (params.newPassword.trim() != '') {
                if (params.newPassword == params.confirmPassword) {
                    user.password = params.newPassword
                    if (user.validate() && user.save()) {
                        flash.message = message(code: "password.change.success")
                        redirect(action: 'panel')
                    } else {
                        flash.message = message(code: "password.change.fail")
                        redirect(action: 'changePassword')
                    }
                } else {
                    flash.message = message(code: "password.change.notMatch")
                    redirect(action: 'changePassword')
                }
            } else {
                flash.message = message(code: "password.change.emptyPassword")
                redirect(action: 'changePassword')
            }
        } else {
            flash.message = message(code: "password.change.invalidPassword")
            redirect(action: 'changePassword')
        }
    }

    def register() {

        if (params.forwardUri)
            session.forwardUri = params.forwardUri

        ['customerInstance': new Customer()]
    }

    def checkUserNameIsRepetitive() {
        if (User.findByUsername(params.username?.toString().trim().toLowerCase()))
            render message(code: 'springSecurity.register.username.repetitive')
        else
            render message(code: 'springSecurity.register.username.valid')
    }

    def saveBasicInfo() {
        def customerInstance = new Customer()

        customerInstance.username = params.username
        customerInstance.password = params.password
        customerInstance.email = params.username

        customerInstance.enabled = false

        if (customerInstance.validate() && customerInstance.save()) {
            def customerRole = Role.findByAuthority(RoleHelper.ROLE_CUSTOMER)
            UserRole.create customerInstance, customerRole

            mailService.sendMail {
                to customerInstance.email
                subject message(code: 'activationMail.subject')
                html(view: "/messageTemplates/mail/emailVerification",
                        model: [customer: customerInstance])
            }
            redirect(action: 'checkForActivationMail')
        } else {
            render(view: 'register', model: ['customerInstance': customerInstance])
        }
    }

    def checkForActivationMail() {
    }

    def activate() {
        def code = new String(params.code.toString().decodeBase64()).split('_')[2]
        if (code.toString() == params.id.toString()) {
            def customer = Customer.get(params.id)
            customer.enabled = true
            customer.save()
            flash.message = message(code: 'springSecurity.accountEnabled')
            redirect(controller: 'login', action: 'auth')
            return
        }

        render "code error"
    }

    def profile() {
        [customerInstance: Customer.findByUsername(((User) springSecurityService.currentUser).username)]
    }

    def savePersonalInfo() {
        def customer = Customer.findByUsername(((User) springSecurityService.currentUser).username)
        customer.properties = params
        customer.profilePersonalInfoFilled = true
        if (customer.profilePersonalInfoFilled && customer.profileSendingAddressFilled && customer.registrationLevel == 'basic')
            customer.registrationLevel = 'profile'
        customer.save()
        redirect(action: 'profile')
    }

    def saveAddress() {
        def customer = Customer.findByUsername(((User) springSecurityService.currentUser).username)
        Address address = customer.address
        if (!address)
            address = new Address()
        address.addressLine1 = params.addressLine1
        address.postalCode = params.postalCode
        address.telephone = params.telephone
        address.city = City.get(params.city)
        if (address.validate() && address.save()) {
            customer.address = address
            customer.profileSendingAddressFilled = true
            if (customer.profilePersonalInfoFilled && customer.profileSendingAddressFilled && customer.registrationLevel == 'basic')
                customer.registrationLevel = 'profile'
            customer.save()
        }
        redirect(action: 'profile')
    }

    def saveProfile() {
        def customerInstance = new Customer()

        customerInstance.username = params.username
        customerInstance.password = params.password
        customerInstance.firstName = params.firstName
        customerInstance.lastName = params.lastName
        customerInstance.email = params.email
        customerInstance.mobile = params.mobile
        customerInstance.telephone = params.telephone

        Address billingAddress = new Address(addressLine1: params.billingAddress)
        if (!billingAddress.validate() || !billingAddress.save()) {
            flash.message = billingAddress.errors// message(code: 'register.fail')
            redirect(controller: 'customer', action: 'register', params: ['customerInstance', customerInstance])
            return
        }

        Address sendingAddress = new Address(addressLine1: params.sendingAddress)
        if (!sendingAddress.validate() || !sendingAddress.save()) {
            flash.message = sendingAddress.errors// message(code: 'register.fail')
            redirect(controller: 'customer', action: 'register', params: ['customerInstance', customerInstance])
            return
        }

        customerInstance.billingAddress = (Address) billingAddress
        customerInstance.sendingAddress = (Address) sendingAddress

        customerInstance.enabled = true
        if (customerInstance.validate() && customerInstance.save()) {
            def customerRole = Role.findByAuthority(RoleHelper.ROLE_CUSTOMER)
            UserRole.create customerInstance, customerRole

            flash.message = message(code: 'register.successful')
            if (session.forwardUri) {
                redirect(controller: 'login', params: ['forwardUri': session.forwardUri])
                session.forwardUri = null
            } else
                redirect(controller: 'login')
        } else {
            render(view: 'register', model: ['customerInstance': customerInstance])
        }

    }
}
