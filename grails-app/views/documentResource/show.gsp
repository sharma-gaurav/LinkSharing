<%@ page import="org.codehaus.groovy.grails.commons.ConfigurationHolder; com.intelligrape.linksharing.DocumentResource" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'documentResource.label', default: 'DocumentResource')}"/>
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
                <td valign="top" class="name"><g:message code="documentResource.id.label" default="Id"/></td>

                <td valign="top" class="value">${fieldValue(bean: documentResourceInstance, field: "id")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="documentResource.createdBy.label"
                                                         default="Created By"/></td>

                <td valign="top" class="value"><g:link controller="user" action="show"
                                                       id="${documentResourceInstance?.createdBy?.id}">${documentResourceInstance?.createdBy?.name?.encodeAsHTML()}</g:link></td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="documentResource.dateCreated.label"
                                                         default="Date Created"/></td>

                <td valign="top" class="value"><g:formatDate date="${documentResourceInstance?.dateCreated}"/></td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="documentResource.fileName.label"
                                                         default="File Name"/></td>

                <td valign="top" class="value">
                    <g:link action="download" id="${documentResourceInstance.id}">
                        ${fieldValue(bean: documentResourceInstance, field: "fileName")}
                    </g:link>
                </td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="documentResource.heading.label" default="Heading"/></td>

                <td valign="top" class="value">${fieldValue(bean: documentResourceInstance, field: "heading")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="documentResource.summary.label" default="Summary"/></td>

                <td valign="top" class="value">${fieldValue(bean: documentResourceInstance, field: "summary")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="documentResource.topic.label" default="Topic"/></td>

                <td valign="top" class="value"><g:link controller="topic" action="show"
                                                       id="${documentResourceInstance?.topic?.id}">${documentResourceInstance?.topic?.name?.encodeAsHTML()}</g:link></td>
            </tr>

            </tbody>
        </table>
    </div>

    <div class="buttons">
        <g:form>
            <g:hiddenField name="id" value="${documentResourceInstance?.id}"/>
            <span class="button"><g:actionSubmit class="edit" action="edit"
                                                 value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>
            <span class="button"><g:actionSubmit class="delete" action="delete"
                                                 value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                 onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
        </g:form>
    </div>
</div>
</body>
</html>
