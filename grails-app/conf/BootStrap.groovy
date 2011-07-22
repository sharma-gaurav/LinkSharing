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
        User user1 = new User(userName: "admin", password: "password", confirmPassword: "password", name: "Gaurav",                                       \
                          phoneNumber: 123456789, address: "new delhi", email: "admin@intelligrape.com", isAdmin: true)
        User user2 = new User(userName: "test2", password: "password", confirmPassword: "password", name: "Charu",                                       \
                                                       phoneNumber: 123456789, address: "new delhi", email: "222@intelligrape.com")
        User user3 = new User(userName: "test3", password: "password", confirmPassword: "password", name: "Charu",                                       \
                                                       phoneNumber: 123456789, address: "new delhi", email: "charu@intelligrape.com")
        User user4 = new User(userName: "test4", password: "password", confirmPassword: "password", name: "Charu",                                       \
                                                       phoneNumber: 123456789, address: "new delhi", email: "444@intelligrape.com")
        User user5 = new User(userName: "test5", password: "password", confirmPassword: "password", name: "Charu",                                       \
                                                       phoneNumber: 123456789, address: "new delhi", email: "555@intelligrape.com")
        User user6 = new User(userName: "test6", password: "password", confirmPassword: "password", name: "Gaurav",                                       \
                                                       phoneNumber: 123456789, address: "new delhi", email: "gauravs@intelligrape.com")


        user1.save(flush: true)
        user2.save(flush: true)
        addTopics(user2)
        user3.save(flush: true)
        user5.save(flush: true)
        user6.save(flush: true)
    }

    void addTopics(User user) {

        ('A'..'Z').each {
            new Topic(isPrivate: false, createdBy: user, name: "${it}").save(flush: true)
        }

    }

    def init = { servletContext ->
        addUser()
        addTopics()
        createResources()
        createDocumentResource()

        createRead()
        markUnread()
        printUnread()
    }



    void createResources() {
        Topic.list().each {Topic topic ->
            (1..10).each {
                topic.addToResources(new LinkResource(topic: topic, createdBy: User.get(2), heading: "Grails Heading",                                   \
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
