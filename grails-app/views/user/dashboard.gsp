<%--
  Created by IntelliJ IDEA.
  User: gaurav
  Date: 20/7/11
  Time: 10:43 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="com.intelligrape.linksharing.Resource; com.intelligrape.linksharing.User; com.intelligrape.linksharing.UserResource" contentType="text/html;charset=UTF-8" %>
<html>
<head><title>User Dashboard</title>
    <meta name="layout" content="main"/>
</head>

<body>
<h1>Welcome ${user1.name}</h1>
<br>

<div>
    You have following Unread Resources:
    <br>
    <table>
        <tr>
            <th>Resource Heading</th>
            <th>Belongs To</th>
            <th>Resource Summary</th>
        </tr>
    <g:each in='${user1.resources}'>
        <tr><td>${it.resource.heading}</td>
            <td>${it.resource.topic.name}</td>
            <td>${it.resource.summary}</td></tr>
    </g:each>
    </table>
    %{--<ls:topicTable/>--}%
</div>
</body>
</html>