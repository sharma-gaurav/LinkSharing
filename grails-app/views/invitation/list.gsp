<%@ page import="com.intelligrape.linksharing.Invitation" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'invitation.label', default: 'Invitation')}"/>
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

                <g:sortableColumn property="id" title="${message(code: 'invitation.id.label', default: 'Id')}"/>

                <th><g:message code="invitation.from.label" default="From"/></th>

                <th><g:message code="invitation.to.label" default="To"/></th>

                <th><g:message code="invitation.topic.label" default="Topic"/></th>

            </tr>
            </thead>
            <tbody>
            <g:each in="${invitationInstanceList}" status="i" var="invitationInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td><g:link action="show"
                                id="${invitationInstance.id}">${fieldValue(bean: invitationInstance, field: "id")}</g:link></td>

                    <td>${fieldValue(bean: invitationInstance, field: "from")}</td>

                    <td>${fieldValue(bean: invitationInstance, field: "to")}</td>

                    <td>${fieldValue(bean: invitationInstance, field: "topic")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="paginateButtons">
        <g:paginate total="${invitationInstanceTotal}"/>
    </div>
</div>
</body>
</html>
