package com.intelligrape.linksharing

class UserTopic {

    static belongsTo = [topic: Topic, user: User]

    static constraints = {
    }
}
