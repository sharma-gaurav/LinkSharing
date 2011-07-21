package com.intelligrape.linksharing

class UtilController {

    def index = {
        User user1 = new User(userName: "test122", password: "password", confirmPassword: "password", name: "Gaurav",        \
                        phoneNumber: 123456789, address: "new delhi", email: "111@xyz.com")
        User user2 = new User(userName: "test222", password: "password", confirmPassword: "password", name: "Charu",        \
                        phoneNumber: 123456789, address: "new delhi", email: "2222@def.com")
        if (user1.validate()) {
            user1.save(flush: true, validate: false)

        }
        else {
            user1.errors.allErrors.each {
                println it
            }
        }
        user2.save(flush: true)
        user2.errors.allErrors.each {
            println it
        }
        Topic topic1 = new Topic(isPrivate: false, createdBy: user2, name: "Grails")
        Topic topic2 = new Topic(isPrivate: false, createdBy: user2, name: "ADA")
        topic1.save(flush: true)
        topic1.errors.allErrors.each {
            println it
        }
        topic2.save(flush: true)
        topic2.errors.allErrors.each {
            println it
        }

        UserTopic userTopic = new UserTopic(user: user2, topic: topic1)
        userTopic.save()
        render "The object has been added"

    }

    def createResources = {
        Topic.list().each {Topic topic ->
            (1..10).each {
                topic.addToResources(new LinkResource(topic: topic, createdBy: User.get(1), heading: "Grails Heading",      \
              summary: "Grails summary", url: "http://www.google.com"))
            }
        }
    }
    def createRead = {
        User user = User.get(1)

        (1..10).each {
            user.addToResources(new UserResource(resource: Resource.get(it), isRead: true))
        }
        render "resources added to read resource"
    }
    def markUnread = {
        (1..3).each {
            UserResource userResource = UserResource.get(it)
            userResource.isRead = false
        }
    }
    def printUnread = {
        UserResource.findAllByIsReadAndUser(false, User.get(1)).each {
            println it.resource;
        }
    }
}
