import com.intelligrape.linksharing.User
import com.intelligrape.linksharing.Topic
import com.intelligrape.linksharing.UserTopic
import com.intelligrape.linksharing.LinkResource
import com.intelligrape.linksharing.UserResource
import com.intelligrape.linksharing.Resource
import com.intelligrape.linksharing.DocumentResource
import org.hibernate.Session

class BootStrap {

    void addUser() {
        User user1 = new User(userName: "admin", password: "password", confirmPassword: "password", name: "Gaurav",                                \
                   phoneNumber: 123456789, address: "new delhi", email: "admin@intelligrape.com", isAdmin: true)
        User user2 = new User(userName: "test2", password: "password", confirmPassword: "password", name: "Charu",                                \
                                                phoneNumber: 123456789, address: "new delhi", email: "222@intelligrape.com")
        User user3 = new User(userName: "test3", password: "password", confirmPassword: "password", name: "Charu",                                \
                                                phoneNumber: 123456789, address: "new delhi", email: "333@intelligrape.com")
        User user4 = new User(userName: "test4", password: "password", confirmPassword: "password", name: "Charu",                                \
                                                phoneNumber: 123456789, address: "new delhi", email: "444@intelligrape.com")
        User user5 = new User(userName: "test5", password: "password", confirmPassword: "password", name: "Charu",                                \
                                                phoneNumber: 123456789, address: "new delhi", email: "555@intelligrape.com")
        User user6 = new User(userName: "test6", password: "password", confirmPassword: "password", name: "Charu",                                \
                                                phoneNumber: 123456789, address: "new delhi", email: "666@intelligrape.com")

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
        user3.save(flush: true)
        user3.errors.allErrors.each {
            println it
        }
        user4.save(flush: true)
        user4.errors.allErrors.each {
            println it
        }
        user5.save(flush: true)
        user5.errors.allErrors.each {
            println it
        }
        user6.save(flush: true)
        user6.errors.allErrors.each {
            println it
        }
    }

    void addTopic() {
        Topic topic1 = new Topic(isPrivate: false, createdBy: User.findByUserName('test6'), name: "Grails")
        Topic topic2 = new Topic(isPrivate: false, createdBy: User.findByUserName('test2'), name: "ADA")
        Topic topic3 = new Topic(isPrivate: false, createdBy: User.findByUserName('test3'), name: "Groovy")
        Topic topic4 = new Topic(isPrivate: false, createdBy: User.findByUserName('test4'), name: "Maths")
        Topic topic5 = new Topic(isPrivate: false, createdBy: User.findByUserName('test5'), name: "C++")

        topic1.save(flush: true)
        topic1.errors.allErrors.each {
            println it
        }
        topic2.save(flush: true)
        topic2.errors.allErrors.each {
            println it
        }

        topic3.save(flush: true)
        topic3.errors.allErrors.each {
            println it
        }
        topic4.save(flush: true)
        topic4.errors.allErrors.each {
            println it
        }

        topic5.save(flush: true)
        topic5.errors.allErrors.each {
            println it
        }



        UserTopic userTopic6 = new UserTopic(user: User.findByUserName('test2'), topic: topic1)
        userTopic6.save()
        UserTopic userTopic2 = new UserTopic(user: User.findByUserName('test3'), topic: topic5)
        userTopic2.save()
        UserTopic userTopic3 = new UserTopic(user: User.findByUserName('test2'), topic: topic4)
        userTopic3.save()
        UserTopic userTopic4 = new UserTopic(user: User.findByUserName('test3'), topic: topic2)
        userTopic4.save()
        UserTopic userTopic5 = new UserTopic(user: User.findByUserName('test4'), topic: topic2)
        userTopic5.save()
        UserTopic userTopic7 = new UserTopic(user: User.findByUserName('test4'), topic: topic3)
        userTopic7.save()
        UserTopic userTopic8 = new UserTopic(user: User.findByUserName('test5'), topic: topic3)
        userTopic8.save()
        UserTopic userTopic9 = new UserTopic(user: User.findByUserName('test5'), topic: topic5)
        userTopic9.save()
        User.findByUserName('test2').addToUserTopics(new UserTopic(topic: topic3))
        User.findByUserName('test2').addToUserTopics(new UserTopic(topic: topic5))

    }

    def init = { servletContext ->
        addUser()
        addTopic()
        createResources()
        createDocumentResource()

        createRead()
        markUnread()
        printUnread()
    }



    void createResources() {
        Topic.list().each {Topic topic ->
            (1..10).each {
                topic.addToResources(new LinkResource(topic: topic, createdBy: User.get(2), heading: "Grails Heading",                            \
                                        summary: "Grails summary", url: "http://www.google.com"))
            }
        }
        println "created resource"
    }

    void createDocumentResource() {
        (1..5).each {
            Topic.list().each {Topic topic ->
                DocumentResource documentResource = new DocumentResource(topic: topic, createdBy: User.get(3), heading: "New Document",
                        summary: "User 3 Document", fileName: "New Resource ${it}", uuid: UUID.randomUUID().toString())

                documentResource.save(flush: true)
                topic.addToResources(documentResource)
            }
        }

        println "Created Document resource"
    }

    void createRead() {

        (1..10).each {
            UserResource userResource = new UserResource(user: User.get(2), resource: Resource.get(it), isRead: true)
            userResource.save(flush: true)
        }
        println "resources added to read resource"
    }

    void markUnread() {
        (1..3).each {
            UserResource userResource = UserResource.get(it)
            userResource.isRead = false
        }
        println "Marked unread"
    }

    void printUnread() {
        UserResource.findAllByIsReadAndUser(false, User.get(2)).each {
            println it.resource;
        }
        println "Marked read"
    }

    def destroy = {
    }
}
