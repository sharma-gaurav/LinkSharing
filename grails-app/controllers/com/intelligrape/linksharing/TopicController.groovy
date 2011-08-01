package com.intelligrape.linksharing

class TopicController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 5, 100)
        List<Topic> topicList = Topic.findAllByIsPrivateAndNameIlike(false, "%${params.searchText}%", params)
        Integer totalCount = Topic.countByIsPrivateAndNameIlike(false, "%${params.searchText}%")
        [topicInstanceList: topicList, topicInstanceTotal: totalCount, searchText: params.searchText]
    }

    def create = {
        Topic topicInstance = new Topic()
        topicInstance.properties = params
        return [topicInstance: topicInstance]
    }

    def save = {
        Topic topicInstance = new Topic(params)
        if (topicInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'topic.label', default: 'Topic'), topicInstance.id])}"
            redirect(action: "show", id: topicInstance.id)
        }
        else {
            render(view: "create", model: [topicInstance: topicInstance])
        }
    }

    def show = {
        Topic topicInstance = Topic.get(params.id)
        if (topicInstance) {
            [topicInstance: topicInstance]
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'topic.label', default: 'Topic'), params.id])}"
            redirect(action: "list")
        }
    }

    def edit = {
        Topic topicInstance = Topic.get(params.id)
        if (topicInstance) {
            return [topicInstance: topicInstance]
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'topic.label', default: 'Topic'), params.id])}"
            redirect(action: "list")
        }
    }

    def update = {
        Topic topicInstance = Topic.get(params.id)
        if (topicInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (topicInstance.version > version) {

                    topicInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'topic.label', default: 'Topic')] as Object[], "Another user has updated this Topic while you were editing")
                    render(view: "edit", model: [topicInstance: topicInstance])
                    return
                }
            }
            topicInstance.properties = params
            if (!topicInstance.hasErrors() && topicInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'topic.label', default: 'Topic'), topicInstance.id])}"
                redirect(action: "show", id: topicInstance.id)
            }
            else {
                render(view: "edit", model: [topicInstance: topicInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'topic.label', default: 'Topic'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        Topic topicInstance = Topic.get(params.id)
        if (topicInstance) {
            try {
                topicInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'topic.label', default: 'Topic'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'topic.label', default: 'Topic'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'topic.label', default: 'Topic'), params.id])}"
            redirect(action: "list")
        }
    }
}
