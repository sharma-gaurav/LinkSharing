package com.intelligrape.linksharing

import grails.plugin.spock.IntegrationSpec
import com.sun.servicetag.SystemEnvironment

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
        SendCommand sendCommand = new SendCommand()

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
        SendCommand sendCommand = new SendCommand()

        when:
        sendCommand.tos = ["gauravs@intelligrape.com"]
        sendCommand.from = null
        sendCommand.topic = Topic.list().last().id
        controller.sendHandler(sendCommand)

        then:
        controller.response.contentAsString == "Mail not send."
    }
}