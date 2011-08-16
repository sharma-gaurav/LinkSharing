<%@ page import="com.intelligrape.linksharing.DocumentResource" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'documentResource.label', default: 'DocumentResource')}"/>
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

                <g:sortableColumn property="id" title="${message(code: 'documentResource.id.label', default: 'Id')}"
                                  params="['topicId':topicId]"/>

                <th><g:message code="documentResource.createdBy.label" default="Created By"
                               params="['topicId':topicId]"/></th>

                <g:sortableColumn property="dateCreated"
                                  title="${message(code: 'documentResource.dateCreated.label', default: 'Date Created')}"
                                  params="['topicId':topicId]"/>

                <g:sortableColumn property="fileName"
                                  title="${message(code: 'documentResource.fileName.label', default: 'File Name')}"
                                  params="['topicId':topicId]"/>

                <g:sortableColumn property="heading"
                                  title="${message(code: 'documentResource.heading.label', default: 'Heading')}"
                                  params="['topicId':topicId]"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${documentResources}" status="i" var="documentResourceInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td><g:link action="show"
                                id="${documentResourceInstance.id}">${fieldValue(bean: documentResourceInstance, field: "id")}</g:link></td>

                    <td>${documentResourceInstance.createdBy.name}</td>

                    <td><g:formatDate date="${documentResourceInstance.dateCreated}"/></td>

                    <td>${fieldValue(bean: documentResourceInstance, field: "fileName")}</td>

                    <td>${fieldValue(bean: documentResourceInstance, field: "heading")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="paginateButtons">
        <g:paginate total="${documentResourcesTotal}" params="['topicId':topicId]"/>
    </div>

    <ls:ifSubscribed topicId="${topicId}">
        <g:form controller="documentResource" action="create" params="['topicId':topicId]">
            <g:submitButton name="create" value="Add Document Resource"/>
        </g:form>
    </ls:ifSubscribed>

</div>
</body>
</html>