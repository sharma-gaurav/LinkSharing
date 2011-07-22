package com.intelligrape.linksharing

class LoginController {

    def login = {
    }

    def loginHandler = {
        User user = User.findByUserNameAndPassword(params.userName, params.password)
        if (user) {
            session.currentUser = user.id;
            if (user.isAdmin) {
                redirect(controller: 'admin', action: 'stats')
            }
            else {
                redirect(controller: 'user', action: 'dashboard')
            }
            false
        }
        else {
            flash.message = "User Name and Password does not Match"
            redirect(controller: 'login', action: 'login')
            false
        }
    }

    def logout = {
        session.invalidate();
        redirect(action: login)
    }
}
