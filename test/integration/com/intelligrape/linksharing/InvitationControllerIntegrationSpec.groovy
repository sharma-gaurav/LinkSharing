package com.intelligrape.linksharing

import grails.plugin.spock.IntegrationSpec

class InvitationControllerIntegrationSpec extends IntegrationSpec {

    def mailingService
    InvitationController controller = new InvitationController()

    Map renderArgs
    Map redirectArgs

    def setup() {
        controller.metaClass.render = {Map map ->
            renderArgs = map
        }
    }

    def "test the sendHandler mailing action"() {
        setup:
        controller.mailingService = mailingService
        SendCO sendCommand = new SendCO()

        when:
        sendCommand.tos = ["gauravs@intelligrape.com"]
        sendCommand.from = User.list().last().id
        sendCommand.topic = Topic.list().last().id
        controller.sendHandler(sendCommand)

        then:
        controller.response.contentAsString == "mail sent"
    }

    def "test the error condition in sendHandler"() {
        setup:
        SendCO sendCommand = new SendCO()

        when:
        sendCommand.tos = ["gauravs@intelligrape.com"]
        sendCommand.from = null
        sendCommand.topic = Topic.list().last().id
        controller.sendHandler(sendCommand)

        then:
        controller.response.contentAsString == "Mail not send."
    }
}