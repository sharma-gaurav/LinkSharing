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

    def dateGetter = {
        println params.name
        if (User.findByName(params.name)) {
            render(Map[message: "Hello You exist"] as JSON)
        }
        else {
            render(Map[message: "Sorry You dont exist"] as JSON)
        }
    }
}
