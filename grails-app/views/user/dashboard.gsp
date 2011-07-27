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
    <div">
        <div style="float:left; width: 49%">
            <h3>You have following Resources:</h3>
            <br>

            <div>
                %{--<g:button>Unread Resources</g:button>--}%
                %{--<g:button>All Resources</g:button>--}%
            </div>
            <table>
                <tr>
                    <th>Resource Heading</th>
                    <th>Topic</th>
                    <th>Resource Summary</th>
                </tr>
                <g:each in='${resourceList}'>
                    <tr>
                        <td>
                            %{--<g:link controller="resource" action="show" id="${it?.resource?.id}">--}%
                            ${it?.resource?.heading}
                            %{--</g:link>--}%
                        </td>
                        <td>${it?.resource?.topic?.name}</td>
                        <td>${it?.resource?.summary}</td></tr>
                </g:each>
            </table>
            <br>
        </div>

        <div style="float:right; width:49%">
            <h3>Topics Subscribed By You are:</h3>
            <br>
            <table>
                <tr>
                    <th>Topic Name</th>
                </tr>
                <g:each in="${topicsList}" var="topic">
                    <tr>
                        <td><g:link controller="topic" action="show"
                                    id="${topic.topic.id}">${topic.topic?.name}</g:link></td>
                    </tr>
                </g:each>
            </table>

            <div class="paginateButtons">
                <g:paginate total="${topicListTotal}"/>
            </div>
            <br>
        </div>
    </div>

    <div>
        <div style="float:left; width:49%">
            <h3>Most Subscribed Topics are:</h3>
            <br>
            <table>
                <tr>
                    <th>Topic</th>
                    <th>Number of Subscribers</th>
                </tr>
                <g:each in="${topicList}" var="topic">
                    <tr>
                        <td><g:link controller="topic" action="show" id="${topic?.first()?.id}">
                            ${topic?.first()?.name}</g:link></td>
                        <td>${topic?.last()}</td>
                    </tr>
                </g:each>
            </table>
            <br>
        </div>

        <div style="float:right; width:49%">
            <h3>Most Read Resources are:</h3>
            <br>
            <table>
                <tr>
                    <th>Resource Name</th>
                    <th>Read by Number of User</th>
                </tr>
                <g:each in="${mostRead}" var="resource">
                    <tr>
                        <td><g:link controller="resource" action="show" id="${resource?.first()?.id}">
                            ${resource?.first()?.heading}</g:link></td>
                        <td>${resource?.last()}</td>
                    </tr>
                </g:each>
            </table>
            <br>
        </div>
    </div>
</div>
</body>
</html>