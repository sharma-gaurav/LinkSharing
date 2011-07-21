<%--
  Created by IntelliJ IDEA.
  User: gaurav
  Date: 19/7/11
  Time: 12:52 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>

<head><title>Login Page</title>
</head>


<body>
<g:form action="loginHandler" method="POST">
    <div>
        <table>
            <tr><td>User Name:</td>
                <td><input type="text" name="userName"/></td></tr>
            <tr><td>Password:</td>
                <td><input type="password" name="password"/></td></tr>
            <tr><td></td><td><input type="submit" name="Submit"/></td></tr>
        </table>
    </div>



    <br>
    <g:link controller='user' action='register'>Register New User</g:link>
</g:form>
</body>
</html>