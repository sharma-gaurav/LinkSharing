package com.intelligrape.linksharing

class User implements Serializable {

    String userName
    String password
    String confirmPassword
    String name
    int phoneNumber
    String address
    String email
    boolean isAdmin = false
    static transients = ['confirmPassword']

    static hasMany = [userTopics: UserTopic, invitations: Invitation, resources: UserResource]
    static mappedBy = [invitations: 'from']

    static constraints = {
        userName(unique: true, minSize: 5, maxSize: 16)
        password(minSize: 6, maxSize: 16, validator: {value, object ->
            if (value != object.confirmPassword)
                return "user.password.mismatch"
        })
        name()
        address()
        email(email: true, unique: true)
        phoneNumber(maxSize: 12)
    }

    static mapping = {
        address type: 'text'
    }

}
