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
    <script src="${resource(dir: 'js', file: 'jquery.tablesorter.js')}" type="text/javascript">
    </script>
    <script src="${resource(dir: 'js', file: 'jquery-ui-1.8.14.custom.min.js')}" type="text/javascript">
    </script>

</head>

<body>

<h1>Welcome ${user1.name}</h1>
<br>

<div class="demo">
    <div id="tabs">
        <ul>
            <li><a href="#tabs-1">Unread Resources:</a></li>
            <li><a href="#tabs-2">Topics Subscribed:</a></li>
            <li><a href="#tabs-4">Most Read Resources:</a></li>
            <li><a href="#tabs-3">Most Subscribed Topics:</a></li>
            <li></li>
        </ul>

        <div id="tabs-1">
            %{--<div>--}%
            %{--<g:button>Unread Resources</g:button>--}%
            %{--<g:button>All Resources</g:button>--}%
            %{--</div>--}%
            <table class="tablesorter">
                <thead>
                <tr>
                    <th>Resource Heading</th>
                    <th>Topic</th>
                    <th>Resource Summary</th>
                </tr>
                </thead>
                <tbody>
                <g:each in='${resourceList}' var="userResource">
                    <tr>
                        <td>
                            <g:link controller="resource" action="show"
                                    id="${userResource?.resource?.id}">
                                ${userResource?.resource?.heading}</g:link></td>
                        <td>${userResource?.resource?.topic?.name}</td>
                        <td>${userResource?.resource?.summary}</td></tr>
                </g:each>
                </tbody>
            </table>

        </div>

        <div id="tabs-2">
            <table class="tablesorter">
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


        <div id="tabs-3">
            <table class="tablesorter">
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
        </div>

        <div id="tabs-4">
            <table class="tablesorter">
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

<jq:jquery>
    $(document).ready(function(){
      $(".tablesorter").tablesorter();
  })
  $("#tabs").tabs();
</jq:jquery>
</body>
</html>