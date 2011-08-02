package com.intelligrape.linksharing

class UserController {

    def populateListService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

    def create = {
        User userInstance = new User()
        userInstance.properties = params
        return [userInstance: userInstance]
    }

    def save = {
        User userInstance = new User(params)
        if (userInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
            redirect(action: "show", id: userInstance.id)
        }
        else {
            render(view: "create", model: [userInstance: userInstance])
        }
    }

    def show = {
        User userInstance = User.get(params.id)
        if (userInstance) {
            [userInstance: userInstance]
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
    }

    def edit = {
        User userInstance = User.get(params.id)
        if (userInstance) {
            return [userInstance: userInstance]
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
    }

    def update = {
        User userInstance = User.get(params.id)
        if (userInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (userInstance.version > version) {

                    userInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'user.label', default: 'User')] as Object[], "Another user has updated this User while you were editing")
                    render(view: "edit", model: [userInstance: userInstance])
                    return
                }
            }
            userInstance.properties = params
            if (!userInstance.hasErrors() && userInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
                redirect(action: "show", id: userInstance.id)
            }
            else {
                render(view: "edit", model: [userInstance: userInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        User userInstance = User.get(params.id)
        if (userInstance) {
            try {
                userInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
    }
    def register = {
        User user = new User()
        [userInstance: user]

    }

    def registerHandler = {
        User user = new User(params)
        if (user.save()) {
            flash.message = "You are successfully Register!! Now you can Log In!!"
            render(view: '/login/login')
        }
        else {
            render(view: "register", model: [userInstance: user])
        }
    }

    def dashboard = {
        User user = User.get(session.currentUser)
        [user1: user]
    }

    def topicList = {
        User user = User.get(session.currentUser)
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        List<UserTopic> topics = UserTopic.findAllByUser(user, params)
        Integer topicCount = UserTopic.countByUser(user)
        render(template: "topicListTemplate", model: [topicsList: topics, topicListTotal: topicCount])

    }

    def unreadResourceList = {
        User user = User.get(session.currentUser)
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        List<UserResource> resources = UserResource.findAllByUserAndIsRead(user, false, [max: params.max, offset: params.offset])
        Integer resourceListTotal = UserResource.countByUserAndIsRead(user, false)
        render(template: "resourceListTemplate", model: [resources: resources, resourceListTotal: resourceListTotal])
    }

    def mostSubscribedTopicList = {
        List<List> mostSubscribedTopics = populateListService.topicList(params.max ? params.int('max') : 10, params.offset ? params.int("offset") : 0)
        Integer mostSubscribedTopicsTotal = populateListService.topicListTotal()
        render(template: "mostSubscribedTopicListTemplate", model: [mostSubscribedTopics: mostSubscribedTopics, mostSubscribedTopicsTotal: mostSubscribedTopicsTotal])
    }

    def mostReadResourceList = {
        List<List> mostReadResources = populateListService.resourceList(params.max ? params.int('max') : 10, params.offset ? params.int("offset") : 0)
        Integer mostReadResourcesTotal = populateListService.resourceListTotal()
        render(template: "mostReadResourceListTemplate", model: [mostReadResources: mostReadResources, mostReadResourcesTotal: mostReadResourcesTotal])
    }
    def emailValidate = {
        User user = User.findByEmail(params.email)
        if (user) {
            render "false"
        } else {
            render "true"
        }
    }

    def userNameValidate = {
        User user = User.findByUserName(params.userName)
        if (user) {
            render "false"
        } else {
            render "true"
        }
    }
}
