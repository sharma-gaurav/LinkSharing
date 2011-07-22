<%@ page import="com.intelligrape.linksharing.DocumentResource" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'documentResource.label', default: 'DocumentResource')}"/>
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

                <g:sortableColumn property="id" title="${message(code: 'documentResource.id.label', default: 'Id')}"/>

                <g:sortableColumn property="uuid"
                                  title="${message(code: 'documentResource.uuid.label', default: 'Uuid')}"/>

                <th><g:message code="documentResource.createdBy.label" default="Created By"/></th>

                <g:sortableColumn property="dateCreated"
                                  title="${message(code: 'documentResource.dateCreated.label', default: 'Date Created')}"/>

                <g:sortableColumn property="fileName"
                                  title="${message(code: 'documentResource.fileName.label', default: 'File Name')}"/>

                <g:sortableColumn property="heading"
                                  title="${message(code: 'documentResource.heading.label', default: 'Heading')}"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${documentResourceInstanceList}" status="i" var="documentResourceInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td><g:link action="show"
                                id="${documentResourceInstance.id}">${fieldValue(bean: documentResourceInstance, field: "id")}</g:link></td>

                    <td>${fieldValue(bean: documentResourceInstance, field: "uuid")}</td>

                    <td>${fieldValue(bean: documentResourceInstance, field: "createdBy")}</td>

                    <td><g:formatDate date="${documentResourceInstance.dateCreated}"/></td>

                    <td>${fieldValue(bean: documentResourceInstance, field: "fileName")}</td>

                    <td>${fieldValue(bean: documentResourceInstance, field: "heading")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="paginateButtons">
        <g:paginate total="${documentResourceInstanceTotal}"/>
    </div>
</div>
</body>
</html>
