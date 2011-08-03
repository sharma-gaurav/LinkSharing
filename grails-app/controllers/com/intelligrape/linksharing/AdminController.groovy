package com.intelligrape.linksharing

import junit.framework.Test

class AdminController {

    def stats = {
        [userNumber: User.count(), topicNumber: Topic.count(), invitationNumber: Invitation.count()]
    }

    def topicListPopulate = {
        params.max = Math.min(params.max ? params.int('max') : 10, 50)
        List<Topic> topicList = Topic.list(params)
        Integer topicCount = Topic.count()
        render(template: "topicTableTemplate", model: [topicCount: topicCount, topicList: topicList])
    }

    def resourceListPopulate = {
        params.max = Math.min(params.max ? params.int('max') : 10, 50)
        List<Resource> resourceList = Resource.list(params)
        Integer resourceCount = Resource.count()
        render(template: "resourceTableTemplate", model: [resourceList: resourceList, resourceCount: resourceCount])
    }

    def userListPopulate = {
        params.max = Math.min(params.max ? params.int('max') : 10, 50)
        List<User> userList = User.list(params)
        Integer userCount = User.count()
        render(template: "userTableTemplate", model: [userList: userList, userCount: userCount])
    }
}
