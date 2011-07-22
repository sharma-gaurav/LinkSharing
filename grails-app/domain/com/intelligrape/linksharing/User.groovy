package com.intelligrape.linksharing

class User implements Serializable {

    String userName
    String password
    String confirmPassword
    String name
    Long phoneNumber
    String address
    String email
    boolean isAdmin = false
    static transients = ['confirmPassword']

    static hasMany = [userTopics: UserTopic, invitations: Invitation, resources: UserResource]
    static mappedBy = [invitations: 'from']

    static constraints = {
        userName(unique: true, minSize: 5, maxSize: 16, nullable: false, blank: false)
        password(minSize: 6, maxSize: 16, nullable: false, blank: false, validator: {value, object ->
            if (value != object.confirmPassword)
                return "user.password.mismatch"
        })
        name(nullable: false, blank: false)
        address(nullable: false, blank: false)
        email(nullable: false, blank: false, email: true, unique: true)
        phoneNumber(maxSize: 12, blank: false)
    }

    static mapping = {
        address type: 'text'
    }

}
