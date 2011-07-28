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

//    def dateGetter = {
    //        println params
    //        if (User.findByUserNameAndPassword(params.userName,params.password)) {
    //            render([message: "Hello you are a valid user"] as JSON)
    //        }
    //        else {
    //            render([message: "Sorry You are not a valid user"] as JSON)
    //        }
    //    }
    def emailValidate = {
        User user = User.findByEmail(params.email)
        if (user) {
            render false
        } else {
            render true
        }
    }
}
