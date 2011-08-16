<%@ page import="com.intelligrape.linksharing.LinkResource" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'linkResource.label', default: 'LinkResource')}"/>
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
                <td valign="top" class="name"><g:message code="linkResource.id.label" default="Id"/></td>

                <td valign="top" class="value">${fieldValue(bean: linkResourceInstance, field: "id")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="linkResource.url.label" default="Url"/></td>

                <td valign="top" class="value">
                    <g:link url="${linkResourceInstance?.url}">${fieldValue(bean: linkResourceInstance, field: "url")}</g:link>
                </td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="linkResource.createdBy.label" default="Created By"/></td>

                <td valign="top" class="value">${linkResourceInstance?.createdBy?.name}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="linkResource.dateCreated.label"
                                                         default="Date Created"/></td>

                <td valign="top" class="value"><g:formatDate date="${linkResourceInstance?.dateCreated}"/></td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="linkResource.heading.label" default="Heading"/></td>

                <td valign="top" class="value">${fieldValue(bean: linkResourceInstance, field: "heading")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="linkResource.summary.label" default="Summary"/></td>

                <td valign="top" class="value">${fieldValue(bean: linkResourceInstance, field: "summary")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="linkResource.topic.label" default="Topic"/></td>

                <td valign="top" class="value"><g:link controller="topic" action="show"
                                                       id="${linkResourceInstance?.topic?.id}">${linkResourceInstance?.topic?.name}</g:link></td>

            </tr>

            </tbody>
        </table>
    </div>

    <div class="buttons">
        <g:form>
            <g:hiddenField name="id" value="${linkResourceInstance?.id}"/>
            <ls:ifCurrentUserOrAdmin id="${linkResourceInstance?.createdBy?.id}">
                <span class="button"><g:actionSubmit class="edit" action="edit"
                                                     value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>
                <span class="button"><g:actionSubmit class="delete" action="delete"
                                                     value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                     onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
            </ls:ifCurrentUserOrAdmin>
            <span class="button"><g:actionSubmit action="markUnread" value="Mark Unread"
                                                 onclick="return alert('Resource Marked Unread')" /></span>
        </g:form>
    </div>
</div>
</body>
</html>