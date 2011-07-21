<%@ page import="com.intelligrape.linksharing.User" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    </span>
    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label"
                                                                           args="[entityName]"/></g:link></span>
    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label"
                                                                               args="[entityName]"/></g:link></span>
</div>

<div class="body">
    <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${userInstance}">
        <div class="errors">
            <g:renderErrors bean="${userInstance}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form method="post">
        <g:hiddenField name="id" value="${userInstance?.id}"/>
        <g:hiddenField name="version" value="${userInstance?.version}"/>
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="userName"><g:message code="user.userName.label" default="User Name"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'userName', 'errors')}">
                        <g:textField name="userName" maxlength="16" value="${userInstance?.userName}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="password"><g:message code="user.password.label" default="Password"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'password', 'errors')}">
                        <g:textField name="password" maxlength="16" value="${userInstance?.password}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="name"><g:message code="user.name.label" default="Name"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'name', 'errors')}">
                        <g:textField name="name" value="${userInstance?.name}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="address"><g:message code="user.address.label" default="Address"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'address', 'errors')}">
                        <g:textField name="address" value="${userInstance?.address}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="email"><g:message code="user.email.label" default="Email"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'email', 'errors')}">
                        <g:textField name="email" value="${userInstance?.email}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="phoneNumber"><g:message code="user.phoneNumber.label"
                                                            default="Phone Number"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'phoneNumber', 'errors')}">
                        <g:textField name="phoneNumber"
                                     value="${fieldValue(bean: userInstance, field: 'phoneNumber')}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="invitations"><g:message code="user.invitations.label"
                                                            default="Invitations"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'invitations', 'errors')}">

                        <ul>
                            <g:each in="${userInstance?.invitations?}" var="i">
                                <li><g:link controller="invitation" action="show"
                                            id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        </ul>
                        <g:link controller="invitation" action="create"
                                params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'invitation.label', default: 'Invitation')])}</g:link>

                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="isAdmin"><g:message code="user.isAdmin.label" default="Is Admin"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'isAdmin', 'errors')}">
                        <g:checkBox name="isAdmin" value="${userInstance?.isAdmin}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="resources"><g:message code="user.resources.label" default="Resources"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'resources', 'errors')}">

                        <ul>
                            <g:each in="${userInstance?.resources?}" var="r">
                                <li><g:link controller="userResource" action="show"
                                            id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        </ul>
                        <g:link controller="userResource" action="create"
                                params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'userResource.label', default: 'UserResource')])}</g:link>

                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="userTopics"><g:message code="user.userTopics.label" default="User Topics"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'userTopics', 'errors')}">

                        <ul>
                            <g:each in="${userInstance?.userTopics?}" var="u">
                                <li><g:link controller="userTopic" action="show"
                                            id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        </ul>
                        <g:link controller="userTopic" action="create"
                                params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'userTopic.label', default: 'UserTopic')])}</g:link>

                    </td>
                </tr>

                </tbody>
            </table>
        </div>

        <div class="buttons">
            <span class="button"><g:actionSubmit class="save" action="update"
                                                 value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>
            <span class="button"><g:actionSubmit class="delete" action="delete"
                                                 value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                 onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
        </div>
    </g:form>
</div>
</body>
</html>
