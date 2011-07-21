package com.intelligrape.linksharing

import junit.framework.Test

class AdminController {

    def stats = {
        [userNumber: User.count(), topicNumber: Topic.count(), invitationNumber: Invitation.count()]

    }


}
