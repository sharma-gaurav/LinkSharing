<%@ page import="com.intelligrape.linksharing.User" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
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
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="dialog">
        <table>
            <tbody>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="user.id.label" default="Id"/></td>

                <td valign="top" class="value">${fieldValue(bean: userInstance, field: "id")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="user.userName.label" default="User Name"/></td>

                <td valign="top" class="value">${fieldValue(bean: userInstance, field: "userName")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="user.password.label" default="Password"/></td>

                <td valign="top" class="value">${fieldValue(bean: userInstance, field: "password")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="user.name.label" default="Name"/></td>

                <td valign="top" class="value">${fieldValue(bean: userInstance, field: "name")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="user.address.label" default="Address"/></td>

                <td valign="top" class="value">${fieldValue(bean: userInstance, field: "address")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="user.email.label" default="Email"/></td>

                <td valign="top" class="value">${fieldValue(bean: userInstance, field: "email")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="user.phoneNumber.label" default="Phone Number"/></td>

                <td valign="top" class="value">${fieldValue(bean: userInstance, field: "phoneNumber")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="user.invitations.label" default="Invitations"/></td>

                <td valign="top" style="text-align: left;" class="value">
                    <ul>
                        <g:each in="${userInstance.invitations}" var="i">
                            <li><g:link controller="invitation" action="show"
                                        id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
                        </g:each>
                    </ul>
                </td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="user.isAdmin.label" default="Is Admin"/></td>

                <td valign="top" class="value"><g:formatBoolean boolean="${userInstance?.isAdmin}"/></td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="user.resources.label" default="Resources"/></td>

                <td valign="top" style="text-align: left;" class="value">
                    <ul>
                        <g:each in="${userInstance.resources}" var="r">
                            <li><g:link controller="userResource" action="show"
                                        id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                        </g:each>
                    </ul>
                </td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="user.userTopics.label" default="User Topics"/></td>

                <td valign="top" style="text-align: left;" class="value">
                    <ul>
                        <g:each in="${userInstance.userTopics}" var="u">
                            <li><g:link controller="userTopic" action="show"
                                        id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
                        </g:each>
                    </ul>
                </td>

            </tr>

            </tbody>
        </table>
    </div>

    <div class="buttons">
        <g:form>
            <g:hiddenField name="id" value="${userInstance?.id}"/>
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
