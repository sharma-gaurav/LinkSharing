package com.intelligrape.linksharing

class Invitation {

    User from
    User to
    Topic topic

    static belongsTo = [User, Topic]

    static constraints = {
    }
}
