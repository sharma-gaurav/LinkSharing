<%@ page import="com.intelligrape.linksharing.Topic" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}"/>
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
                <td valign="top" class="name"><g:message code="topic.id.label" default="Id"/></td>

                <td valign="top" class="value">${fieldValue(bean: topicInstance, field: "id")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="topic.createdBy.label" default="Created By"/></td>

                <td valign="top" class="value">${topicInstance?.createdBy?.name}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="topic.dateCreated.label" default="Date Created"/></td>

                <td valign="top" class="value"><g:formatDate date="${topicInstance?.dateCreated}"/></td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="topic.isPrivate.label" default="Is Private"/></td>

                <td valign="top" class="value"><g:formatBoolean boolean="${topicInstance?.isPrivate}"/></td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="topic.name.label" default="Name"/></td>

                <td valign="top" class="value">${fieldValue(bean: topicInstance, field: "name")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="topic.resources.label" default="Resources"/></td>

                <td valign="top" style="text-align: left;" class="value">
                    <g:link controller="linkResource" action="list"
                            params="[topicId:topicInstance.id]">Link Resources</g:link>
                    <br>
                    <g:link controller="documentResource" action="list"
                            params="[topicId:topicInstance.id]">Document Resources</g:link>
                </td>

            </tr>

            </tbody>
        </table>
    </div>

    <div class="buttons">
        <g:form>
            <ls:ifCurrentUserOrAdmin id='${topicInstance?.createdBy?.id}'>
                <g:hiddenField name="id" value="${topicInstance?.id}"/>
                <span class="button"><g:actionSubmit class="edit" action="edit"
                                                     value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>

                <span class="button"><g:actionSubmit class="delete" action="delete"
                                                     value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                     onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
            </ls:ifCurrentUserOrAdmin>
            <span class="button"><g:submitButton name="invitation" controller='invitation' action='send'
                                                 params="['id':topicInstance?.id]" value="Invite Others"/>
            </span>
        </g:form>
    </div>

    <div>

    </div>
</div>
</body>
</html>
