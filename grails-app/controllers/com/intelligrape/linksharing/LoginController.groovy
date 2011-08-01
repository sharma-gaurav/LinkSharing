package com.intelligrape.linksharing

import grails.converters.JSON

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
        }
        else {
            flash.message = "User Name and Password does not Match"
            redirect(controller: 'login', action: 'login')
        }
    }

    def logout = {
        session.invalidate();
        redirect(action: login)
    }
}
