package com.intelligrape.linksharing

class Topic implements Serializable {
    boolean isPrivate = false
    Date dateCreated
    String name

    static hasMany = [userTopics: UserTopic, resources: Resource]
    static belongsTo = [createdBy: User]

    static constraints = {

    }

    def afterInsert = {
        User user = this.createdBy
        UserTopic userTopic = new UserTopic(topic: this, user: user)
        user.addToUserTopics(userTopic)
        this.addToUserTopics(userTopic)
    }
}
