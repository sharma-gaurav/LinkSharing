<%@ page contentType="text/html;charset=UTF-8" %>
<html>

<head>
    <title>Login Page</title>
    <meta name="layout" content="login"/>
</head>


<body>
<div>
    <input type="button" id="Time" name="Time" value="Get Time"/>
</div>

<div id="test">

</div>

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
            <tr><td></td><td><input type="submit" name="Submit" value="Sign In"/></td></tr>

        </table>
    </div>



    <br>
    <g:link controller='user' action='register'>Register New User</g:link>
</g:form>
<jq:jquery>
    function updateDateTime(){
%{--jQuery.ajax({--}%
%{--'url' : "${createLink(controller: 'login', action: 'dateGetter')}",--}%
%{--'success': function(data){--}%
%{--console.debug(data)--}%
%{--jQuery("#test").text(data.message)--}%
%{--})--}%
        var name = $("input[name=userName]").val()
        jQuery.get("${createLink(controller: 'login', action: 'dateGetter')}",{'name':name}, function(data){
                jQuery("#test").text(data.message)
        })
    }

    $('#Time').click(updateDateTime)
</jq:jquery>
</body>
</html>