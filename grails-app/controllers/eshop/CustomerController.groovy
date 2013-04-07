package eshop

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

    }
}
