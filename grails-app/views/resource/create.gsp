<%@ page import="com.intelligrape.linksharing.Resource" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'resource.label', default: 'Resource')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    </span>
    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label"
                                                                           args="[entityName]"/></g:link></span>
</div>

<div class="body">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${resourceInstance}">
        <div class="errors">
            <g:renderErrors bean="${resourceInstance}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form action="save">
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="createdBy"><g:message code="resource.createdBy.label" default="Created By"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: resourceInstance, field: 'createdBy', 'errors')}">
                        <g:select name="createdBy.id" from="${com.intelligrape.linksharing.User.list()}" optionKey="id"
                                  value="${resourceInstance?.createdBy?.id}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="heading"><g:message code="resource.heading.label" default="Heading"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: resourceInstance, field: 'heading', 'errors')}">
                        <g:textField name="heading" value="${resourceInstance?.heading}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="summary"><g:message code="resource.summary.label" default="Summary"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: resourceInstance, field: 'summary', 'errors')}">
                        <g:textField name="summary" value="${resourceInstance?.summary}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="topic"><g:message code="resource.topic.label" default="Topic"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: resourceInstance, field: 'topic', 'errors')}">
                        <g:select name="topic.id" from="${com.intelligrape.linksharing.Topic.list()}" optionKey="id"
                                  value="${resourceInstance?.topic?.id}"/>
                    </td>
                </tr>

                </tbody>
            </table>
        </div>

        <div class="buttons">
            <span class="button"><g:submitButton name="create" class="save"
                                                 value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
        </div>
    </g:form>
</div>
</body>
</html>
