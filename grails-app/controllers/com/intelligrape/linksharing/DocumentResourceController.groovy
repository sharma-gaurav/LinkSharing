package com.intelligrape.linksharing

import org.codehaus.groovy.grails.commons.ConfigurationHolder

class DocumentResourceController {
    def populateListService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        if (params.topicId) {
            Topic topic = Topic.get(params.topicId)
            List<DocumentResource> documentResources = Resource.findAllByTopicAndType(topic,"document",params)
            Integer documentResourcesTotal = Resource.countByTopicAndType(topic,"document")
            [documentResources: documentResources,documentResourcesTotal: documentResourcesTotal, topicId: params.topicId]
        } else {
            [documentResources: DocumentResource.list(params), documentResourcesTotal: DocumentResource.count()]
        }
    }

    def create = {
        DocumentResource documentResourceInstance = new DocumentResource()
        documentResourceInstance.properties = params
        if (params.topicId) {
            documentResourceInstance.topic = Topic.get(params.topicId)
        }
        return [documentResourceInstance: documentResourceInstance]
    }

    def save = {
        DocumentResource documentResourceInstance = new DocumentResource(params)
        documentResourceInstance.document = params?.document

        if (documentResourceInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'documentResource.label', default: 'DocumentResource'), documentResourceInstance.id])}"
            redirect(action: "show", id: documentResourceInstance.id)
        }
        else {
            render(view: "create", model: [documentResourceInstance: documentResourceInstance])
        }
    }

    def show = {
        DocumentResource documentResourceInstance = DocumentResource.get(params.id)
        if (documentResourceInstance) {
            [documentResourceInstance: documentResourceInstance]
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'documentResource.label', default: 'DocumentResource'), params.id])}"
            redirect(action: "list")
        }
    }

    def edit = {
        DocumentResource documentResourceInstance = DocumentResource.get(params.id)
        if (documentResourceInstance) {
            return [documentResourceInstance: documentResourceInstance]
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'documentResource.label', default: 'DocumentResource'), params.id])}"
            redirect(action: "list")
        }
    }

    def update = {
        DocumentResource documentResourceInstance = DocumentResource.get(params.id)
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
        DocumentResource documentResourceInstance = DocumentResource.get(params.id)
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

    def download = {
        DocumentResource documentResource = DocumentResource.get(params.id)
        File file = new File("${ConfigurationHolder.config.path + documentResource.uuid}-${documentResource.fileName}")
        response.setContentType("application/octet-stream")
        response.setHeader("Content-disposition", "filename=${documentResource.fileName}")
        response.outputStream << file.bytes
        render(view: "show")
    }
}