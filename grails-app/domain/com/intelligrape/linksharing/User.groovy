package com.intelligrape.linksharing

class User {

    String userName
    String passWord
    String name
    int phoneNumber
    String address
    String email
    boolean isAdmin=false

    static hasMany = [topics:Topic, invitations:Invitation, resources:UserResource]
    static mappedBy = [invitations:'from']

    static constraints = {
        userName(unique: true, minSize:5, maxSize: 16)
        passWord(minSize: 6, maxSize: 16)
        name()
        address()
        email(email: true, unique:true)
        phoneNumber(maxSize: 12)
    }

}
