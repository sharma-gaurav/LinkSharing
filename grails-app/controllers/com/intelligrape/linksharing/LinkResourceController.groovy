package com.intelligrape.linksharing

class LinkResourceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [linkResourceInstanceList: LinkResource.list(params), linkResourceInstanceTotal: LinkResource.count()]
    }

    def create = {
        LinkResource linkResourceInstance = new LinkResource()
        linkResourceInstance.properties = params
        return [linkResourceInstance: linkResourceInstance]
    }

    def save = {
        LinkResource linkResourceInstance = new LinkResource(params)
        if (linkResourceInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'linkResource.label', default: 'LinkResource'), linkResourceInstance.id])}"
            redirect(action: "show", id: linkResourceInstance.id)
        }
        else {
            render(view: "create", model: [linkResourceInstance: linkResourceInstance])
        }
    }

    def show = {
        LinkResource linkResourceInstance = LinkResource.get(params.id)
        if (linkResourceInstance) {
            [linkResourceInstance: linkResourceInstance]
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'linkResource.label', default: 'LinkResource'), params.id])}"
            redirect(action: "list")
        }
    }

    def edit = {
        LinkResource linkResourceInstance = LinkResource.get(params.id)
        if (linkResourceInstance) {
            return [linkResourceInstance: linkResourceInstance]
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'linkResource.label', default: 'LinkResource'), params.id])}"
            redirect(action: "list")
        }
    }

    def update = {
        LinkResource linkResourceInstance = LinkResource.get(params.id)
        if (linkResourceInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (linkResourceInstance.version > version) {

                    linkResourceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'linkResource.label', default: 'LinkResource')] as Object[], "Another user has updated this LinkResource while you were editing")
                    render(view: "edit", model: [linkResourceInstance: linkResourceInstance])
                    return
                }
            }
            linkResourceInstance.properties = params
            if (!linkResourceInstance.hasErrors() && linkResourceInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'linkResource.label', default: 'LinkResource'), linkResourceInstance.id])}"
                redirect(action: "show", id: linkResourceInstance.id)
            }
            else {
                render(view: "edit", model: [linkResourceInstance: linkResourceInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'linkResource.label', default: 'LinkResource'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        LinkResource linkResourceInstance = LinkResource.get(params.id)
        if (linkResourceInstance) {
            try {
                linkResourceInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'linkResource.label', default: 'LinkResource'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'linkResource.label', default: 'LinkResource'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'linkResource.label', default: 'LinkResource'), params.id])}"
            redirect(action: "list")
        }
    }
}
