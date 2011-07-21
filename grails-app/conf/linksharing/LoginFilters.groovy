package linksharing

import com.intelligrape.linksharing.User

class LoginFilters {

    def filters = {
        all(controller: 'login|user', action: 'login|register|save|loginHandler', invert: true) {
            before = {
                if (!session.currentUser) {
                    redirect(controller: 'login', action: 'login')
                }
            }
        }
//        login(controller: 'login', action: 'login') {
        //            after = {
        //                if (User?.get(session.currentUser)?.userName != 'admin') {
        //                    false
        //                }
        //                else {
        //                    redirect(action: "stats")
        //                }
        //
        //            }
        //        }
    }

}
