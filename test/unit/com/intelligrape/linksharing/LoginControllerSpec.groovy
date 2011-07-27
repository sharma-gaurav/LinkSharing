package com.intelligrape.linksharing

import grails.plugin.spock.ControllerSpec
import spock.lang.Unroll

class LoginControllerSpec extends ControllerSpec {

    @Unroll("Test login Handler #sno")
    def "test the login handler"() {
        setup:
        mockDomain(User)

        when:
        User user1 = new User(userName: "admin", password: "password", confirmPassword: "password", name: "Gaurav", phoneNumber: 123456789, address: "new delhi", email: "admin@intelligrape.com", isAdmin: true).save(flush: true)
        User user2 = new User(userName: "test1", password: "password", confirmPassword: "password", name: "Saurav", phoneNumber: 123456789, address: "new delhi", email: "test@intelligrape.com", isAdmin: false).save(flush: true)
        mockParams.userName = name
        mockParams.password = password
        controller.loginHandler()

        then:
        redirectArgs.controller == controllerName
        redirectArgs.action == actionName
        mockSession.currentUser == userId
        println user1.name
        println user2.name

        where:
        sno | name    | password   | controllerName | actionName  | userId
        1   | "admin" | "password" | "admin"        | "stats"     | 1
        2   | "test1" | "password" | "user"         | "dashboard" | 4
        3   | "test2" | "password" | "login"        | "login"     | null

    }
}
