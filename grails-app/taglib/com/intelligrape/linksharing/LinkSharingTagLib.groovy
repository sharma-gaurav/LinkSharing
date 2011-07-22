package com.intelligrape.linksharing

import java.awt.List

class LinkSharingTagLib {

    static namespace = "ls"

    def myDateFormat = {attrs ->
        Date myDate = attrs['date']
        out << myDate.format("MMM dd yyyy")
    }

    def stateList = {
        def stateList = ["New Delhi", "Mumbai", "Calcutta", "Chennai"]
        out << g.render(template: "/user/states", model: [stateList1: stateList])
    }

    def topicTable = {
        out << g.render(template: "/topic/listTable", model: [topicInstanceList: Topic.list(params), topicInstanceTotal: Topic.count()])
    }

    def showLoggedInUserName = {
        out << User.get(session.currentUser).name
    }

    def ifCurrentUser = {attrs, body ->
        if (session?.currentUser == attrs['id']) {
            out << body()
        }
    }

    def isSubscribed = {attrs, body ->
        Integer topicCount = UserTopic.countByUserAndTopic(User.get(session.currentUser), attrs['topic'])
        if (!topicCount) {
            out << body()
        }
    }
}
