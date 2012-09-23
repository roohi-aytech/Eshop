package eshop

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON
import grails.plugins.springsecurity.Secured

@Secured(RoleHelper.ROLE_USER_ADMIN)
class UserController {
    def springSecurityService

    def form() {
        def user
        if (params.id)
            user = User.findById(params.id)
        else
            user = new User()

        render(template: "/user/form", model: [userInstance: user])
    }

    def save() {
        def user
        if (params.id) {
            user = User.get(params.id)
            user.properties = params
        }
        else
            user = new User(params)
        if (user.validate()) {
            user.save(flush: true)
            UserRole.removeAll(user)
            def roles = request.getParameterValues('authorities').collect {Role.findById(it.toLong())}
            roles.each {
                UserRole.create(user, it)
            }
            render user as JSON
        }
        else {
            render(template: "/user/form", model: [userInstance: user])
        }
    }

    def delete() {
        def user = User.get(params.id)
        if (user)
            user.delete()
        render 0
    }

    def list() {

    }

    def index() {
        redirect(action: "list")
    }

    @Secured([RoleHelper.ROLE_USER, "IS_AUTHENTICATED_FULLY"])
    def profile() {
        def uri = params.redirect
        if (uri && uri.indexOf('/', 1) > 1)
            uri = uri.substring(uri.indexOf('/', 1))
        session.setAttribute("curpage", uri)
        [userInstance: User.findByUsername(springSecurityService.getPrincipal().getUsername())]
    }

    @Secured([RoleHelper.ROLE_USER, "IS_AUTHENTICATED_FULLY"])
    def saveProfile() {
        def user = User.findByUsername(springSecurityService.getPrincipal().getUsername())
        user.properties = params
        if (params.password1 || params.password2) {
            if (params.password1 == params.password2)
                user.password = params.password1
            else {
                user.errors.rejectValue("password", "password.not.match")
                render(view: "profile", model: [userInstance: user])
                return
            }
        }
        if (user.validate()) {
            user.save()
            redirect(url: session.getAttribute("curpage"))
        }
        else
            render(view: "profile", model: [userInstance: user])
    }

    @Secured([RoleHelper.ROLE_USER, "IS_AUTHENTICATED_FULLY"])
    def cancel() {
        redirect(url: session.getAttribute("curpage"))
    }

}
