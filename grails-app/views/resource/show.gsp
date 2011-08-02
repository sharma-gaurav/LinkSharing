<%@ page import="com.intelligrape.linksharing.Resource" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'resource.label', default: 'Resource')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<div class="body">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="dialog">
        <table>
            <tbody>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="resource.id.label" default="Id"/></td>

                <td valign="top" class="value">${fieldValue(bean: resourceInstance, field: "id")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="resource.createdBy.label" default="Created By"/></td>

                <td valign="top" class="value">${resourceInstance?.createdBy?.name}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="resource.dateCreated.label" default="Date Created"/></td>

                <td valign="top" class="value"><g:formatDate date="${resourceInstance?.dateCreated}"/></td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="resource.heading.label" default="Heading"/></td>

                <td valign="top" class="value">${fieldValue(bean: resourceInstance, field: "heading")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="resource.summary.label" default="Summary"/></td>

                <td valign="top" class="value">${fieldValue(bean: resourceInstance, field: "summary")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="resource.topic.label" default="Topic"/></td>

                <td valign="top" class="value"><g:link controller="topic" action="show"
                                                       id="${resourceInstance?.topic?.id}">${resourceInstance?.topic?.name}</g:link></td>

            </tr>

            </tbody>
        </table>
    </div>

    <div class="buttons">
        <g:form>
            <g:hiddenField name="id" value="${resourceInstance?.id}"/>
            <ls:ifCurrentUser id="${resourceInstance?.createdBy?.id}">
                <span class="button"><g:actionSubmit class="edit" action="edit"
                                                     value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>
                <span class="button"><g:actionSubmit class="delete" action="delete"
                                                     value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                     onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
            </ls:ifCurrentUser>
            <ls:ifRead resource="${resourceInstance}">
                <span class="button"><g:actionSubmit action="markUnread" value="Mark Unread" onclick="return alert('Resource Marked Unread')"/></span>
            </ls:ifRead>

        </g:form>
    </div>

</div>
</body>
</html>
