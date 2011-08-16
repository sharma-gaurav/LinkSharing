<%@ page import="com.intelligrape.linksharing.Topic; com.intelligrape.linksharing.LinkResource" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'linkResource.label', default: 'LinkResource')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<div class="body">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="list">
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="id" title="${message(code: 'linkResource.id.label', default: 'Id')}"
                                  params="['topicId':topicId]"/>

                <g:sortableColumn property="url" title="${message(code: 'linkResource.url.label', default: 'Url')}"
                                  params="['topicId':topicId]"/>

                <th><g:message code="linkResource.createdBy.label" default="Created By"/></th>

                <g:sortableColumn property="dateCreated"
                                  title="${message(code: 'linkResource.dateCreated.label', default: 'Date Created')}"
                                  params="['topicId':topicId]"/>

                <g:sortableColumn property="heading"
                                  title="${message(code: 'linkResource.heading.label', default: 'Heading')}"
                                  params="['topicId':topicId]"/>

                <g:sortableColumn property="summary"
                                  title="${message(code: 'linkResource.summary.label', default: 'Summary')}"
                                  params="['topicId':topicId]"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${linkResources}" status="i" var="linkResourceInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td><g:link action="show"
                                id="${linkResourceInstance.id}">${fieldValue(bean: linkResourceInstance, field: "id")}</g:link></td>

                    <td>${fieldValue(bean: linkResourceInstance, field: "url")}</td>

                    <td>${linkResourceInstance.createdBy.name}</td>

                    <td><g:formatDate date="${linkResourceInstance.dateCreated}"/></td>

                    <td>${fieldValue(bean: linkResourceInstance, field: "heading")}</td>

                    <td>${fieldValue(bean: linkResourceInstance, field: "summary")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="paginateButtons">
        <g:paginate total="${linkResourcesTotal}" params="['topicId':topicId]"/>
    </div>

    <ls:ifSubscribed topicId="${topicId}">
        <g:form controller="linkResource" action="create" params="['topicId':topicId]">
            <g:submitButton name="create" value="Add List Resource" />
        </g:form>
    </ls:ifSubscribed>
</div>
</body>
</html>