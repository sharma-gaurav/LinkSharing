package linksharing

import com.intelligrape.linksharing.User

class LoginFilters {

    def filters = {
        all(controller: 'login|user', action: 'login|register|save|loginHandler|registerHandler|emailValidate|userNameValidate', invert: true) {
            before = {
                if (!session.currentUser && controllerName) {
                    flash.message = "Please Login!"
                    redirect(controller: 'login', action: 'login')
                }
            }
        }
    }

}
