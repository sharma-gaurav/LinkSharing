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
    <h2>You have following Unread Resources:</h2>
    <br>
    <table>
        <tr>
            <th>Resource Heading</th>
            <th>Topic</th>
            <th>Resource Summary</th>
        </tr>
        <g:each in='${resourceList}'>
        %{--<g:if test="${it?.isRead}=='false'">--}%
            <tr>
                <td>
                    <g:link controller="resource" action="show" id="${it?.resource?.id}">
                        ${it?.resource?.heading}
                    </g:link>
                </td>
                <td>${it?.resource?.topic?.name}</td>
                <td>${it?.resource?.summary}</td></tr>
        %{--</g:if>--}%
        </g:each>
    </table>
</div>

<div padding-top='20'>
    <h2>Topics Subscribed By You are:</h2>
    <br>
    <table>
        <tr>
            <th>Topic Name</th>
        </tr>
        <g:each in="${topicsList}" var="topic">
            <tr>
                <td><g:link controller="topic" action="show" id="${topic.topic.id}">${topic.topic?.name}</g:link></td>
            </tr>
        </g:each>
    </table>
</div>

<div>
    <h2></h2>
</div>
</body>
</html>