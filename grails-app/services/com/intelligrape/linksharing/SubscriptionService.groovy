package com.intelligrape.linksharing

class SubscriptionService {

    static transactional = true

    void subscribeTopicAndPopulateResources(User user, Topic topic) {
        UserTopic userTopic = new UserTopic(user: user, topic: topic)
        user.addToUserTopics(userTopic)
        topic.addToUserTopics(userTopic)
        topic.resources.each {resource ->
            UserResource userResource = new UserResource(user: user, resource: resource, isRead: false)
            user.addToResources(userResource)
        }
        user.save(failOnError: true)
    }
}
