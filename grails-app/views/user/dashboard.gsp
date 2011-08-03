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
        </ul>

        <div id="tabs-1">
            <div id="resourceListTemplateDivId">
                <g:include controller="user" action="unreadResourceList"/>
            </div>
        </div>

        <div id="tabs-2">
            <div id="topicListTemplateDivId">
                <g:include controller="user" action="topicList"/>
            </div>
        </div>


        <div id="tabs-3">
            <div id="mostSubscribedTopicListTemplateDivId">
                <g:include controller="user" action="mostSubscribedTopicList"/>
            </div>
        </div>

        <div id="tabs-4">
            <div id="mostReadResourceListTemplateDivId">
                <g:include controller="user" action="mostReadResourceList"/>
            </div>
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