package com.intelligrape.linksharing

class InvitationController {
    def mailingService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [invitationInstanceList: Invitation.list(params), invitationInstanceTotal: Invitation.count()]
    }

    def create = {
        Invitation invitationInstance = new Invitation()
        invitationInstance.properties = params
        return [invitationInstance: invitationInstance]
    }

    def save = {
        Invitation invitationInstance = new Invitation(params)
        if (invitationInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'invitation.label', default: 'Invitation'), invitationInstance.id])}"
            redirect(action: "show", id: invitationInstance.id)
        }
        else {
            render(view: "create", model: [invitationInstance: invitationInstance])
        }
    }

    def show = {
        Invitation invitationInstance = Invitation.get(params.id)
        if (invitationInstance) {
            [invitationInstance: invitationInstance]
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invitation.label', default: 'Invitation'), params.id])}"
            redirect(action: "list")
        }
    }

    def edit = {
        def invitationInstance = Invitation.get(params.id)
        if (invitationInstance) {
            return [invitationInstance: invitationInstance]
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invitation.label', default: 'Invitation'), params.id])}"
            redirect(action: "list")
        }
    }

    def update = {
        def invitationInstance = Invitation.get(params.id)
        if (invitationInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (invitationInstance.version > version) {

                    invitationInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'invitation.label', default: 'Invitation')] as Object[], "Another user has updated this Invitation while you were editing")
                    render(view: "edit", model: [invitationInstance: invitationInstance])
                    return
                }
            }
            invitationInstance.properties = params
            if (!invitationInstance.hasErrors() && invitationInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'invitation.label', default: 'Invitation'), invitationInstance.id])}"
                redirect(action: "show", id: invitationInstance.id)
            }
            else {
                render(view: "edit", model: [invitationInstance: invitationInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invitation.label', default: 'Invitation'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def invitationInstance = Invitation.get(params.id)
        if (invitationInstance) {
            try {
                invitationInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'invitation.label', default: 'Invitation'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'invitation.label', default: 'Invitation'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invitation.label', default: 'Invitation'), params.id])}"
            redirect(action: "list")
        }
    }

    def send = {
        Topic topicToSend = Topic.get(params.id)
        User sender = User.get(session.currentUser);
        [from: sender, topic: topicToSend]
    }

    def sendHandler = {SendCO cmd ->
        if (cmd.from) {
            mailingService.sendInvitation(cmd.tos, cmd.from, cmd.topic)
            render "mail sent"

        }
        else {
            render "Mail not send."
        }
    }
}
