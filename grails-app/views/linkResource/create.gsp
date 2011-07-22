<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'linkResource.label', default: 'LinkResource')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div class="body">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${linkResourceInstance}">
        <div class="errors">
            <g:renderErrors bean="${linkResourceInstance}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form action="save">
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="url"><g:message code="linkResource.url.label" default="Url"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: linkResourceInstance, field: 'url', 'errors')}">
                        <g:textField name="url" value="${linkResourceInstance?.url}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="createdBy"><g:message code="linkResource.createdBy.label"
                                                          default="Created By"/></label>
                    </td>
                    <td valign="top"
                        class="value ${hasErrors(bean: linkResourceInstance, field: 'createdBy', 'errors')}">
                        <ls:showLoggedInUserName/>
                        <g:hiddenField name="createdBy.id" value="${session.currentUser}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="heading"><g:message code="linkResource.heading.label" default="Heading"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: linkResourceInstance, field: 'heading', 'errors')}">
                        <g:textField name="heading" value="${linkResourceInstance?.heading}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="summary"><g:message code="linkResource.summary.label" default="Summary"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: linkResourceInstance, field: 'summary', 'errors')}">
                        <g:textField name="summary" value="${linkResourceInstance?.summary}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="topic"><g:message code="linkResource.topic.label" default="Topic"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: linkResourceInstance, field: 'topic', 'errors')}">
                        ${linkResourceInstance?.topic?.name}
                        <g:hiddenField name="topic.id" value="${linkResourceInstance?.topic?.id}"/>
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
