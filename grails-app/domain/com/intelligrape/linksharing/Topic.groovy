package com.intelligrape.linksharing

import org.hibernate.cfg.annotations.reflection.XMLContext.Default

class Topic {
    boolean isPrivate=false
    User createdBy
    Date dateCreated
    String name

    static hasMany = [users:User, resources:Resource]
    static belongsTo = User

    static constraints = {

    }
}
