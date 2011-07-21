<%@ page import="com.intelligrape.linksharing.Resource" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'resource.label', default: 'Resource')}"/>
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

                <g:sortableColumn property="id" title="${message(code: 'resource.id.label', default: 'Id')}"/>

                <th><g:message code="resource.createdBy.label" default="Created By"/></th>

                <g:sortableColumn property="dateCreated"
                                  title="${message(code: 'resource.dateCreated.label', default: 'Date Created')}"/>

                <g:sortableColumn property="heading"
                                  title="${message(code: 'resource.heading.label', default: 'Heading')}"/>

                <g:sortableColumn property="summary"
                                  title="${message(code: 'resource.summary.label', default: 'Summary')}"/>

                <th><g:message code="resource.topic.label" default="Topic"/></th>

            </tr>
            </thead>
            <tbody>
            <g:each in="${resourceInstanceList}" status="i" var="resourceInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td><g:link action="show"
                                id="${resourceInstance.id}">${fieldValue(bean: resourceInstance, field: "id")}</g:link></td>

                    <td>${fieldValue(bean: resourceInstance, field: "createdBy")}</td>

                    <td><g:formatDate date="${resourceInstance.dateCreated}"/></td>

                    <td>${fieldValue(bean: resourceInstance, field: "heading")}</td>

                    <td>${fieldValue(bean: resourceInstance, field: "summary")}</td>

                    <td>${fieldValue(bean: resourceInstance, field: "topic")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="paginateButtons">
        <g:paginate total="${resourceInstanceTotal}"/>
    </div>
</div>
</body>
</html>
