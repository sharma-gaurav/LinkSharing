package com.intelligrape.linksharing

class ResourceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [resourceInstanceList: Resource.list(params), resourceInstanceTotal: Resource.count()]
    }

    def create = {
        Resource resourceInstance = new Resource()
        resourceInstance.properties = params
        return [resourceInstance: resourceInstance]
    }

    def save = {
        Resource resourceInstance = new Resource(params)
        if (resourceInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'resource.label', default: 'Resource'), resourceInstance.id])}"
            redirect(action: "show", id: resourceInstance.id)
        }
        else {
            render(view: "create", model: [resourceInstance: resourceInstance])
        }
    }

    def show = {
        Resource resourceInstance = Resource.get(params.id)
        UserResource userResourceInstance = UserResource?.findByResourceAndUser(resourceInstance, User.get(session.currentUser))
        if (resourceInstance) {
            if (!User.get(session.currentUser).isAdmin) {
                userResourceInstance?.isRead = true
                userResourceInstance.save(flush: true)
            }
            [resourceInstance: resourceInstance]
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'resource.label', default: 'Resource'), params.id])}"
            redirect(action: "list")
        }
    }

    def edit = {
        Resource resourceInstance = Resource.get(params.id)
        if (resourceInstance) {
            return [resourceInstance: resourceInstance]
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'resource.label', default: 'Resource'), params.id])}"
            redirect(action: "list")
        }
    }

    def update = {
        Resource resourceInstance = Resource.get(params.id)
        if (resourceInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (resourceInstance.version > version) {

                    resourceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'resource.label', default: 'Resource')] as Object[], "Another user has updated this Resource while you were editing")
                    render(view: "edit", model: [resourceInstance: resourceInstance])
                    return
                }
            }
            resourceInstance.properties = params
            if (!resourceInstance.hasErrors() && resourceInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'resource.label', default: 'Resource'), resourceInstance.id])}"
                redirect(action: "show", id: resourceInstance.id)
            }
            else {
                render(view: "edit", model: [resourceInstance: resourceInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'resource.label', default: 'Resource'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        Resource resourceInstance = Resource.get(params.id)
        if (resourceInstance) {
            try {
                resourceInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'resource.label', default: 'Resource'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'resource.label', default: 'Resource'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'resource.label', default: 'Resource'), params.id])}"
            redirect(action: "list")
        }
    }

    def markUnread = {
        Resource resourceInstance = Resource.get(params.id)
        UserResource userResourceInstance = UserResource?.findByResourceAndUser(resourceInstance, User.get(session.currentUser))
        if (userResourceInstance) {
            userResourceInstance.isRead = false
            userResourceInstance.save(flush: true)
            redirect(controller: "user", action: "dashboard", id: "${params.id}")
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'resource.label', default: 'Resource'), params.id])}"
            redirect(action: "list")
        }
    }
}