<!DOCTYPE html>
<html>
<head>
    <title><g:layoutTitle default="Grails"/></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css/ui-lightness', file: 'jquery-ui-1.8.14.custom.css')}"/>
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>
    <g:javascript library="jquery" />
    <g:layoutHead/>
    <g:javascript library="application"/>
    <style>
    #div {
        float: right
    }
    </style>
</head>

<body>
<div id="grailsLogo"><h1>LINK SHARING APPLICATION</h1></div>

<div class="nav">
    <g:form controller="topic" action="list">
        <span class="menuButton"><a class="home" href="${createLink(uri: '/user/dashboard')}"><g:message
                code="default.home.label"/></a>
        </span>
        <span class="menuButton"><g:link controller="topic" action="create">Create New Topic</g:link></span>
        <span class="menuButton"><g:link controller="login" action="logout">Logout</g:link></span> |
        <span class="menuButton">Today's Date: <ls:myDateFormat date="${new Date()}"/></span>
        <g:textField name="searchText"/>
        <g:submitButton name="searchButton" controller="topic" action="search" value="Search"/>
    </g:form>
</div>
<g:layoutBody/>
</body>
</html>