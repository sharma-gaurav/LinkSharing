<%@ page import="com.intelligrape.linksharing.Topic" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
%{--<div class="nav">--}%
    %{--<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>--}%
    %{--</span>--}%
    %{--<span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label"--}%
                                                                           %{--args="[entityName]"/></g:link></span>--}%
    %{--<span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label"--}%
                                                                               %{--args="[entityName]"/></g:link></span>--}%
%{--</div>--}%

<div class="body">
    <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${topicInstance}">
        <div class="errors">
            <g:renderErrors bean="${topicInstance}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form method="post">
        <g:hiddenField name="id" value="${topicInstance?.id}"/>
        <g:hiddenField name="version" value="${topicInstance?.version}"/>
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="createdBy"><g:message code="topic.createdBy.label" default="Created By"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: topicInstance, field: 'createdBy', 'errors')}">
                        <ls:showLoggedInUserName/>
                        <g:hiddenField name="createdBy.id" value="${session.currentUser}" id="createdBy"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="isPrivate"><g:message code="topic.isPrivate.label" default="Is Private"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: topicInstance, field: 'isPrivate', 'errors')}">
                        <g:checkBox name="isPrivate" value="${topicInstance?.isPrivate}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="name"><g:message code="topic.name.label" default="Name"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: topicInstance, field: 'name', 'errors')}">
                        <g:textField name="name" value="${topicInstance?.name}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="resources"><g:message code="topic.resources.label" default="Resources"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: topicInstance, field: 'resources', 'errors')}">

                        <ul>
                            <g:each in="${topicInstance?.resources?}" var="r">
                                <li><g:link controller="resource" action="show"
                                            id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        </ul>
                        <g:link controller="linkResource" action="create"
                                params="['topic.id': topicInstance?.id]">Add Link Resource</g:link>
                        <g:link controller="documentResource" action="create"
                                params="['topic.id': topicInstance?.id]">Add Document Resource</g:link>
                    </td>
                </tr>

                %{--<tr class="prop">--}%
                    %{--<td valign="top" class="name">--}%
                        %{--<label for="userTopics"><g:message code="topic.userTopics.label" default="User Topics"/></label>--}%
                    %{--</td>--}%
                    %{--<td valign="top" class="value ${hasErrors(bean: topicInstance, field: 'userTopics', 'errors')}">--}%

                        %{--<ul>--}%
                            %{--<g:each in="${topicInstance?.userTopics?}" var="u">--}%
                                %{--<li><g:link controller="userTopic" action="show"--}%
                                            %{--id="${u.id}">${u?.encodeAsHTML()}</g:link></li>--}%
                            %{--</g:each>--}%
                        %{--</ul>--}%
                        %{--<g:link controller="userTopic" action="create"--}%
                                %{--params="['topic.id': topicInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'userTopic.label', default: 'UserTopic')])}</g:link>--}%

                    %{--</td>--}%
                %{--</tr>--}%

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
