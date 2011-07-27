package com.intelligrape.linksharing

class MailingService {

    static transactional = false

    def sendInvitation(tos, from, topic) {
        tos.each {
            def invitation = new Invitation();
            invitation.from = User.get(from)
            invitation.to = User.findByEmail(it);
            invitation.topic = Topic.get(topic)
            invitation.save(flush: true)

            println invitation.from.name
            println invitation.to.email
            if (invitation) {
                sendMail {
                    to invitation.to?.email
                    subject "Hello ${invitation.to?.name}"
                    html "You have got an invitation for the Topic ${invitation.topic?.name} from ${invitation.from?.name}."
                }
            }
        }
    }
}
