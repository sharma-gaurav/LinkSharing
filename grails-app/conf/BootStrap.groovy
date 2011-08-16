import com.intelligrape.linksharing.BootstrapService

class BootStrap {

    def bootstrapService

    def init = {
        bootstrapService.addUser()
        bootstrapService.createResources()
        bootstrapService.subscribeTopicsToUsers()
        bootstrapService.createDocumentResource()
        bootstrapService.createRead()
        bootstrapService.markUnread()
    }
}
