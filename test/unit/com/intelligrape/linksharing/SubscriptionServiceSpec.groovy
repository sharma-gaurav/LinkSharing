package com.intelligrape.linksharing;


import grails.plugin.spock.UnitSpec

public class SubscriptionServiceSpec extends UnitSpec {

    SubscriptionService service = new SubscriptionService()

    def "add user to topic and add resources of the topic"() {
        setup:
        User user = new User(id: 1, address: "Test", email: "test@email.com", name: "test", password: "test1234", phoneNumber: 1234, userName: "Test9", confirmPassword: "test1234")
        Topic topic = new Topic(id: 1, name: "Test", createdBy: user)
        topic.resources = [new Resource(id: 1)]

        mockDomain(User, [user])
        mockDomain(Topic, [topic])

        when:
        service.subscribeTopicAndPopulateResources(user, topic)

        then:
        user.userTopics.toList().size() == 1
        topic.userTopics.toList().size() == 1
        user.resources.toList().size() == 1
    }

}
