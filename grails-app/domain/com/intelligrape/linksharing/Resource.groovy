package com.intelligrape.linksharing

class Resource {

    Topic topic
    User createdBy
    Date dateCreated
    String heading

    static belongsTo = [Topic,User];


    static mapping = {
        tablePerHierarchy false
    }

    static constraints = {

    }
}
