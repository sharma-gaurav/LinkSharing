package com.intelligrape.linksharing

class UserResource {
    User user
    Resource resource
    boolean isRead = false

    static belongsTo = [User, Resource]

    static constraints = {
    }
}
