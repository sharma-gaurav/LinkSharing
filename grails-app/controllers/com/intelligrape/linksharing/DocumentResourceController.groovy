package com.intelligrape.linksharing

class DocumentResourceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [documentResourceInstanceList: DocumentResource.list(params), documentResourceInstanceTotal: DocumentResource.count()]
    }

    def create = {
        def documentResourceInstance = new DocumentResource()
        documentResourceInstance.properties = params
        return [documentResourceInstance: documentResourceInstance]
    }

    def save = {
        def documentResourceInstance = new DocumentResource(params)
        if (documentResourceInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'documentResource.label', default: 'DocumentResource'), documentResourceInstance.id])}"
            redirect(action: "show", id: documentResourceInstance.id)
        }
        else {
            render(view: "create", model: [documentResourceInstance: documentResourceInstance])
        }
    }

    def show = {
        def documentResourceInstance = DocumentResource.get(params.id)
        if (!documentResourceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'documentResource.label', default: 'DocumentResource'), params.id])}"
            redirect(action: "list")
        }
        else {
            [documentResourceInstance: documentResourceInstance]
        }
    }

    def edit = {
        def documentResourceInstance = DocumentResource.get(params.id)
        if (!documentResourceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'documentResource.label', default: 'DocumentResource'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [documentResourceInstance: documentResourceInstance]
        }
    }

    def update = {
        def documentResourceInstance = DocumentResource.get(params.id)
        if (documentResourceInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (documentResourceInstance.version > version) {
                    
                    documentResourceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'documentResource.label', default: 'DocumentResource')] as Object[], "Another user has updated this DocumentResource while you were editing")
                    render(view: "edit", model: [documentResourceInstance: documentResourceInstance])
                    return
                }
            }
            documentResourceInstance.properties = params
            if (!documentResourceInstance.hasErrors() && documentResourceInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'documentResource.label', default: 'DocumentResource'), documentResourceInstance.id])}"
                redirect(action: "show", id: documentResourceInstance.id)
            }
            else {
                render(view: "edit", model: [documentResourceInstance: documentResourceInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'documentResource.label', default: 'DocumentResource'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def documentResourceInstance = DocumentResource.get(params.id)
        if (documentResourceInstance) {
            try {
                documentResourceInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'documentResource.label', default: 'DocumentResource'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'documentResource.label', default: 'DocumentResource'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'documentResource.label', default: 'DocumentResource'), params.id])}"
            redirect(action: "list")
        }
    }
}
