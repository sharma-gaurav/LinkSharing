<%@ page import="com.intelligrape.linksharing.UserResource" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'userResource.label', default: 'UserResource')}"/>
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
    <g:hasErrors bean="${userResourceInstance}">
        <div class="errors">
            <g:renderErrors bean="${userResourceInstance}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form action="save">
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="isRead"><g:message code="userResource.isRead.label" default="Is Read"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userResourceInstance, field: 'isRead', 'errors')}">
                        <g:checkBox name="isRead" value="${userResourceInstance?.isRead}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="resource"><g:message code="userResource.resource.label" default="Resource"/></label>
                    </td>
                    <td valign="top"
                        class="value ${hasErrors(bean: userResourceInstance, field: 'resource', 'errors')}">
                        <g:select name="resource.id" from="${com.intelligrape.linksharing.Resource.list()}"
                                  optionKey="id" value="${userResourceInstance?.resource?.id}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="user"><g:message code="userResource.user.label" default="User"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userResourceInstance, field: 'user', 'errors')}">
                        <g:select name="user.id" from="${com.intelligrape.linksharing.User.list()}" optionKey="id"
                                  value="${userResourceInstance?.user?.id}"/>
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
