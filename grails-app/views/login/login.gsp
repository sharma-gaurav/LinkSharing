<%@ page contentType="text/html;charset=UTF-8" %>
<html>

<head>
    <title>Login Page</title>
    <meta name="layout" content="login"/>
</head>


<body>
<g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
</g:if>
<g:form action="loginHandler" method="POST" controller="login">
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