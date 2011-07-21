<%@ page import="com.intelligrape.linksharing.Topic" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    </span>
    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label"
                                                                               args="[entityName]"/></g:link></span>
</div>

<div class="body">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="list">
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="id" title="${message(code: 'topic.id.label', default: 'Id')}"/>

                <th><g:message code="topic.createdBy.label" default="Created By"/></th>

                <g:sortableColumn property="dateCreated"
                                  title="${message(code: 'topic.dateCreated.label', default: 'Date Created')}"/>

                <g:sortableColumn property="isPrivate"
                                  title="${message(code: 'topic.isPrivate.label', default: 'Is Private')}"/>

                <g:sortableColumn property="name" title="${message(code: 'topic.name.label', default: 'Name')}"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${topicInstanceList}" status="i" var="topicInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td><g:link action="show"
                                id="${topicInstance.id}">${fieldValue(bean: topicInstance, field: "id")}</g:link></td>

                    <td>${fieldValue(bean: topicInstance, field: "createdBy")}</td>

                    <td><g:formatDate date="${topicInstance.dateCreated}"/></td>

                    <td><g:formatBoolean boolean="${topicInstance.isPrivate}"/></td>

                    <td>${fieldValue(bean: topicInstance, field: "name")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="paginateButtons">
        <g:paginate total="${topicInstanceTotal}"/>
    </div>
</div>
</body>
</html>
