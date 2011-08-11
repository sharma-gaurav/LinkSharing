package com.intelligrape.linksharing

class Resource {

    Topic topic
    User createdBy
    Date dateCreated
    String heading
    String summary

    static belongsTo = [Topic, User];


    static mapping = {
        tablePerHierarchy false
        summary type: 'text'
    }

    static constraints = {
        heading(blank: false, nullable: false)
        summary(blank: false, nullable: false)
    }
}
