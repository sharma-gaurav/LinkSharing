package com.intelligrape.linksharing

import org.hibernate.cfg.annotations.reflection.XMLContext.Default

class Topic implements Serializable {
    boolean isPrivate = false
    Date dateCreated
    String name

    static hasMany = [userTopics: UserTopic, resources: Resource]
    static belongsTo = [createdBy: User]

    static constraints = {

    }
}
