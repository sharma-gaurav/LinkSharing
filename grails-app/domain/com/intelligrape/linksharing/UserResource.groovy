package com.intelligrape.linksharing

class UserResource {
    User user
    Resource resource
    boolean isRead = true

    static belongsTo = [User, Resource]

    static constraints = {
    }
}
