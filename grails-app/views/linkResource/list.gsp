<%@ page import="com.intelligrape.linksharing.LinkResource" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'linkResource.label', default: 'LinkResource')}"/>
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

                <g:sortableColumn property="id" title="${message(code: 'linkResource.id.label', default: 'Id')}"/>

                <g:sortableColumn property="url" title="${message(code: 'linkResource.url.label', default: 'Url')}"/>

                <th><g:message code="linkResource.createdBy.label" default="Created By"/></th>

                <g:sortableColumn property="dateCreated"
                                  title="${message(code: 'linkResource.dateCreated.label', default: 'Date Created')}"/>

                <g:sortableColumn property="heading"
                                  title="${message(code: 'linkResource.heading.label', default: 'Heading')}"/>

                <g:sortableColumn property="summary"
                                  title="${message(code: 'linkResource.summary.label', default: 'Summary')}"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${linkResourceInstanceList}" status="i" var="linkResourceInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td><g:link action="show"
                                id="${linkResourceInstance.id}">${fieldValue(bean: linkResourceInstance, field: "id")}</g:link></td>

                    <td>${fieldValue(bean: linkResourceInstance, field: "url")}</td>

                    <td>${fieldValue(bean: linkResourceInstance, field: "createdBy")}</td>

                    <td><g:formatDate date="${linkResourceInstance.dateCreated}"/></td>

                    <td>${fieldValue(bean: linkResourceInstance, field: "heading")}</td>

                    <td>${fieldValue(bean: linkResourceInstance, field: "summary")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="paginateButtons">
        <g:paginate total="${linkResourceInstanceTotal}"/>
    </div>
</div>
</body>
</html>
