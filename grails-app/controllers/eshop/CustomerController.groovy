package eshop

import grails.plugins.springsecurity.Secured
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.Authentication
import org.springframework.security.core.authority.AuthorityUtils
import org.springframework.security.core.context.SecurityContextHolder

class CustomerController {

    def springSecurityService
    def mailService
    def messageService

    def index() {}

    @Secured([RoleHelper.ROLE_CUSTOMER])
    def panel() {
        [customer: Customer.findByUsername(((User) springSecurityService.currentUser).username)]
    }

    @Secured([RoleHelper.ROLE_CUSTOMER])
    def changePassword() {
    }

    @Secured([RoleHelper.ROLE_CUSTOMER])
    def saveNewPassword() {
        def user = (User) springSecurityService.currentUser
        if (user.password == springSecurityService.encodePassword(params.oldPassword)) {
            if (params.newPassword.trim() != '') {
                if (params.newPassword == params.confirmPassword) {
                    user.password = params.newPassword
                    if (user.validate() && user.save()) {
                        flash.message = message(code: "password.change.success")
                        if (user instanceof Customer)
                            redirect(action: 'panel')
                        else
                            redirect(uri: '/admin')
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

        customerInstance.firstName = params.firstName
        customerInstance.lastName = params.lastName
        customerInstance.sex = params.sex
        customerInstance.username = params.username
        customerInstance.password = params.password
        customerInstance.email = params.username
        customerInstance.mobile = params.mobile
        customerInstance.registrationLevel = 'basic'

        if (session['invitation']) {
            def invitation = Invitation.findByIdentifier(session['invitation'].toString())
            customerInstance.reagent = invitation.sender

            if (!invitation.registrationRecorded) {
                invitation.registrationRecorded = true
                invitation.save()

                //grant points to invitation sender
            }
        }

        customerInstance.enabled = false

        if (customerInstance.validate() && customerInstance.save()) {
            def customerRole = Role.findByAuthority(RoleHelper.ROLE_CUSTOMER)
            UserRole.create customerInstance, customerRole


            mailService.sendMail {
                to customerInstance.email
                subject message(code: 'emailTemplates.email_verification.subject')
                html(view: "/messageTemplates/email_template",
                        model: [message: g.render(template: '/messageTemplates/mail/email_verification', model: [customer: customerInstance]).toString()])
            }

            if (customerInstance.mobile)
                messageService.sendMessage(
                        customerInstance.mobile,
                        g.render(template: '/messageTemplates/sms/email_verification', model: [customer: customerInstance]).toString())


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


            mailService.sendMail {
                to customer.email
                subject message(code: 'emailTemplates.activation_result.subject')
                html(view: "/messageTemplates/email_template",
                        model: [message: g.render(template: '/messageTemplates/mail/activation_result', model: [customer: customer]).toString()])
            }

            if (customer.mobile)
                messageService.sendMessage(
                        customer.mobile,
                        g.render(template: '/messageTemplates/sms/activation_result', model: [customer: customer]).toString())


            flash.message = message(code: 'springSecurity.accountEnabled')
            redirect(controller: 'login', action: 'auth')
            return
        }

        render "code error"
    }

    @Secured([RoleHelper.ROLE_CUSTOMER])
    def profile() {
        [customerInstance: Customer.findByUsername(((User) springSecurityService.currentUser).username)]
    }

    @Secured([RoleHelper.ROLE_CUSTOMER])
    def savePersonalInfo() {
        def customer = Customer.findByUsername(((User) springSecurityService.currentUser).username)
        customer.properties = params

        customer.profilePersonalInfoFilled = true
        customer.registrationLevel = 'profile'
        customer.save()

        saveAddress()

        flash.message = message(code: "controlPanel.settings.profile.changes.successMessage")
        redirect(action: 'profile', params: [tab: 'reagent'])
    }

    @Secured([RoleHelper.ROLE_CUSTOMER])
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
            customer.save()
        }
    }

    @Secured([RoleHelper.ROLE_CUSTOMER])
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

    @Secured([RoleHelper.ROLE_CUSTOMER])
    def validateReagent() {
        def reagent = Customer.findByUsername(params.email)
        if (reagent)
            render reagent.toString()
        else
            render 0
    }

    @Secured([RoleHelper.ROLE_CUSTOMER])
    def saveReagent() {
        def customer = springSecurityService.currentUser as Customer
        def reagent = Customer.findByUsername(params.email)
        customer.reagent = reagent
        customer.wayOfKnowing = params.wayOfKnowing

        customer.profileReagentFilled = true
        customer.save()

        flash.message = message(code: "controlPanel.settings.profile.changes.successMessage")
        redirect(action: 'profile', params: [tab: 'favorites'])
    }

    @Secured([RoleHelper.ROLE_CUSTOMER])
    def saveFavorites() {
        def customer = springSecurityService.currentUser as Customer
        customer.favoriteStyle = params.favoriteStyle

        customer.favoriteProductTypes.clear()
        customer.favoriteProductTypes.addAll(ProductType.findAllByIdInList(params.favoriteProductTypes.split(',').collect { it.toLong() }).toArray())

        customer.profileFavoritesFilled = true
        customer.save()

        flash.message = message(code: "controlPanel.settings.profile.changes.successMessage")
        redirect(action: 'profile', params: [tab: 'newsLetters'])
    }

    def forgetPassword() {

    }

    def sendPasswordResetMail() {

        def user = User.findByUsername params.username

        if (user) {

            mailService.sendMail {
                to user.email
                subject message(code: 'emailTemplates.password_rest.subject')
                html(view: "/messageTemplates/email_template",
                        model: [message: g.render(template: '/messageTemplates/mail/password_rest', model: [user: user]).toString()])
            }

            if (user instanceof Customer && ((Customer)user).mobile)
                messageService.sendMessage(
                        user.mobile,
                        g.render(template: '/messageTemplates/sms/password_reset', model: [user: user]).toString())


            flash.message = g.message(code: 'forgetPassword.succeed')
        } else {
            flash.message = g.message(code: 'forgetPassword.wrongUsername')
        }

        render view: 'forgetPassword', model: [user: user]
    }

    def resetPassword() {
        def code
        try {
            code = new String(params.code.toString().decodeBase64()).split('_')[2]
            if (code.toString() == params.id.toString()) {
                def user = User.get(params.id)

            } else {
                render "code error"
            }
        } catch (ex) {
            render "code error"
        }
    }

    def saveResetPassword() {
        def user = User.get(params.userId)
        if (params.newPassword.trim() != '') {
            if (params.newPassword == params.confirmPassword) {
                user.password = params.newPassword
                if (user.validate() && user.save()) {
                    flash.message = message(code: "password.change.success")
                    redirect(action: 'resetPassword', params: [id: params.userId, code: params.code, done: 1])
                } else {
                    flash.message = message(code: "password.change.fail")
                    redirect(action: 'resetPassword', params: [id: params.userId, code: params.code])
                }
            } else {
                flash.message = message(code: "password.change.notMatch")
                redirect(action: 'resetPassword', params: [id: params.userId, code: params.code])
            }
        } else {
            flash.message = message(code: "password.change.emptyPassword")
            redirect(action: 'resetPassword', params: [id: params.userId, code: params.code])
        }
    }

    @Secured([RoleHelper.ROLE_CUSTOMER])
    def newsLetter() {
        [customerInstance: springSecurityService.currentUser as Customer]
    }

    @Secured([RoleHelper.ROLE_CUSTOMER]) v

    def saveNewsLetter() {

        def customer = springSecurityService.currentUser as Customer

        customer.newsLetterCategories.clear()
        if (params.categories)
            customer.newsLetterCategories.addAll(NewsLetterCategory.findAllByIdInList(params.categories.collect { it.toLong() }).toArray())

        customer.newsLetterProductTypes.clear()
        if (params.newsLetterProductTypes)
            customer.newsLetterProductTypes.addAll(ProductType.findAllByIdInList(params.newsLetterProductTypes.split(',').collect { it.toLong() }).toArray())

        customer.profileNewsLettersFilled = true
        customer.registrationLevel = 'full'
        customer.save()

        redirect(action: 'profile', params: [tab: 'personalEvents'])
    }

    @Secured([RoleHelper.ROLE_CUSTOMER])
    def personalEvents() {
        [customerInstance: springSecurityService.currentUser as Customer]
    }

    @Secured([RoleHelper.ROLE_CUSTOMER])
    def invite() {
    }
}
