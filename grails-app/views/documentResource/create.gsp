

<%@ page import="com.intelligrape.linksharing.DocumentResource" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'documentResource.label', default: 'DocumentResource')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${documentResourceInstance}">
            <div class="errors">
                <g:renderErrors bean="${documentResourceInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="uuid"><g:message code="documentResource.uuid.label" default="Uuid" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: documentResourceInstance, field: 'uuid', 'errors')}">
                                    <g:textField name="uuid" value="${documentResourceInstance?.uuid}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="createdBy"><g:message code="documentResource.createdBy.label" default="Created By" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: documentResourceInstance, field: 'createdBy', 'errors')}">
                                    <g:select name="createdBy.id" from="${com.intelligrape.linksharing.User.list()}" optionKey="id" value="${documentResourceInstance?.createdBy?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fileName"><g:message code="documentResource.fileName.label" default="File Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: documentResourceInstance, field: 'fileName', 'errors')}">
                                    <g:textField name="fileName" value="${documentResourceInstance?.fileName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="heading"><g:message code="documentResource.heading.label" default="Heading" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: documentResourceInstance, field: 'heading', 'errors')}">
                                    <g:textField name="heading" value="${documentResourceInstance?.heading}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="summary"><g:message code="documentResource.summary.label" default="Summary" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: documentResourceInstance, field: 'summary', 'errors')}">
                                    <g:textField name="summary" value="${documentResourceInstance?.summary}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="topic"><g:message code="documentResource.topic.label" default="Topic" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: documentResourceInstance, field: 'topic', 'errors')}">
                                    <g:select name="topic.id" from="${com.intelligrape.linksharing.Topic.list()}" optionKey="id" value="${documentResourceInstance?.topic?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
