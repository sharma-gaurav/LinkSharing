package com.intelligrape.linksharing

class MailingService {

    static transactional = false

    def sendInvitation(tos, sendFromUserId, topicId) {
        tos.each {
            def invitation = new Invitation();
            invitation.from = User.get(sendFromUserId)
            invitation.to = User.findByEmail(it);
            invitation.topic = Topic.get(topicId)
            invitation.save(flush: true)

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
