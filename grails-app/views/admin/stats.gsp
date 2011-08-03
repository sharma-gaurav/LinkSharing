<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Admin Stats</title>
    <meta name="layout" content="main"/>
    <script src="${resource(dir: 'js', file: 'jquery-ui-1.8.14.custom.min.js')}" type="text/javascript">
    </script>
</head>

<body>
<h1>Welcome Admin!</h1>

<div>
    <div id="tabs">
        <ul>
            <li><a href="#tab1">Statistics</a></li>
            <li><a href="#tab4">All User</a></li>
            <li><a href="#tab2">All Topics</a></li>
            <li><a href="#tab3">All Resources</a></li>
        </ul>

        <div id="tab1">
            <div>
                The Number of user registered to Link Sharing is ${userNumber}.<br>
                The Number of Topic Posted in Link Sharing is ${topicNumber}.<br>
                The Number of Invitations made to various Topics in Link Sharing is ${invitationNumber}.<br>
            </div>
        </div>

        <div id="tab2">
            <div id="topicTableTemplateId">
                <g:include action="topicListPopulate"/>
            </div>
        </div>

        <div id="tab3">
            <div id="resourceTableTemplateId">
                <g:include action="resourceListPopulate"/>
            </div>
        </div>

        <div id="tab4">
            <div id="userTableTemplateId">
                <g:include action="userListPopulate"/>
            </div>
        </div>
    </div>
</div>
<jq:jquery>
    $("#tabs").tabs();
</jq:jquery>
</body>
</html>