<%--
  Created by IntelliJ IDEA.
  User: gaurav
  Date: 20/7/11
  Time: 12:44 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Send Invitation</title>
    <meta name="layout" content="main"/></head>

<body>
<g:form action="sendHandler">
    <h4>Sending Invitation from: ${from?.email} <br>
        <g:hiddenField name='from' value='${from?.id}'/>
        for the Topic: ${topic?.name} <br>
        <g:hiddenField name='topic' value='${topic?.id}'/>
        To:</h4>
    <table>
        <tr><td><g:textField name='tos'/></td></tr>
        <tr><td><g:textField name='tos'/></td></tr>
        <tr><td><g:textField name='tos'/></td></tr>
        <tr><td><g:textField name='tos'/></td></tr>
        <tr><td><g:textField name='tos'/></td></tr>
        <tr><td align="right"><g:submitButton name="send" value="Send"/></td></tr>
    </table>
</g:form>
</body>
</html>