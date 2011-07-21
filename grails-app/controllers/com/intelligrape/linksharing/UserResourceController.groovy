package com.intelligrape.linksharing

class UserResourceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userResourceInstanceList: UserResource.list(params), userResourceInstanceTotal: UserResource.count()]
    }

    def create = {
        def userResourceInstance = new UserResource()
        userResourceInstance.properties = params
        return [userResourceInstance: userResourceInstance]
    }

    def save = {
        def userResourceInstance = new UserResource(params)
        if (userResourceInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'userResource.label', default: 'UserResource'), userResourceInstance.id])}"
            redirect(action: "show", id: userResourceInstance.id)
        }
        else {
            render(view: "create", model: [userResourceInstance: userResourceInstance])
        }
    }

    def show = {
        def userResourceInstance = UserResource.get(params.id)
        if (!userResourceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userResource.label', default: 'UserResource'), params.id])}"
            redirect(action: "list")
        }
        else {
            [userResourceInstance: userResourceInstance]
        }
    }

    def edit = {
        def userResourceInstance = UserResource.get(params.id)
        if (!userResourceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userResource.label', default: 'UserResource'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [userResourceInstance: userResourceInstance]
        }
    }

    def update = {
        def userResourceInstance = UserResource.get(params.id)
        if (userResourceInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (userResourceInstance.version > version) {

                    userResourceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'userResource.label', default: 'UserResource')] as Object[], "Another user has updated this UserResource while you were editing")
                    render(view: "edit", model: [userResourceInstance: userResourceInstance])
                    return
                }
            }
            userResourceInstance.properties = params
            if (!userResourceInstance.hasErrors() && userResourceInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'userResource.label', default: 'UserResource'), userResourceInstance.id])}"
                redirect(action: "show", id: userResourceInstance.id)
            }
            else {
                render(view: "edit", model: [userResourceInstance: userResourceInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userResource.label', default: 'UserResource'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def userResourceInstance = UserResource.get(params.id)
        if (userResourceInstance) {
            try {
                userResourceInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'userResource.label', default: 'UserResource'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'userResource.label', default: 'UserResource'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userResource.label', default: 'UserResource'), params.id])}"
            redirect(action: "list")
        }
    }
}
