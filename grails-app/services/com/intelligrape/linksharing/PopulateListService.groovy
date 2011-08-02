package com.intelligrape.linksharing

class PopulateListService {

    static transactional = false

    def topicList(Integer max, Integer offset) {
        offset = offset ?: 0
        max = Math.min(max ? max : 10, 100)
        List<List> topicList = UserTopic.createCriteria().list() {
            projections {
                groupProperty("topic")
                count("user")
            }
            topic {
                eq('isPrivate', false)
            }
            maxResults(max)
            firstResult(offset)
        }
        topicList = topicList ? topicList.sort {it.last()}.reverse() : []
        return topicList
    }

    def topicListTotal() {
        Integer mostSubscribedTopicsTotal = UserTopic.createCriteria().get {
            projections {
                countDistinct("topic")
            }
            topic {
                eq('isPrivate', false)
            }
        }
        return mostSubscribedTopicsTotal
    }

    def resourceList(Integer max, Integer offset, User user) {
        offset = offset ?: 0
        max = Math.min(max ? max : 10, 100)
        List<Topic> topics = UserTopic.findAllByUser(user)*.topic
        println topics*.name
        List<List> mostReadResources = UserResource.createCriteria().list() {
            projections {
                groupProperty("resource")
                count("user")
            }
            resource {
                inList("topic", topics)
            }
            eq('isRead', true)
            maxResults(max)
            firstResult(offset)
        }
        mostReadResources = mostReadResources ? mostReadResources.sort {it.last()}.reverse() : []
        return mostReadResources
    }

    def resourceListTotal(User user) {
        println user
        List<Topic> topics = UserTopic.findAllByUser(user)*.topic
        Integer mostReadResourcesTotal = UserResource.createCriteria().get {
            projections {
                countDistinct("resource")
            }
            resource {
                inList("topic", topics)
            }
            eq('isRead', true)
        }
        return mostReadResourcesTotal
    }
}
