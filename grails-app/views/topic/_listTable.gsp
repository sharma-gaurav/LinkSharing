<%--
  Created by IntelliJ IDEA.
  User: gaurav
  Date: 21/7/11
  Time: 1:03 PM
  To change this template use File | Settings | File Templates.
--%>


<div class="body">

    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="list">
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="id" title="${message(code: 'topic.id.label', default: 'Id')}"/>

                <th><g:message code="topic.createdBy.label" default="Created By"/></th>

                <g:sortableColumn property="dateCreated"
                                  title="${message(code: 'topic.dateCreated.label', default: 'Date Created')}"/>

                <g:sortableColumn property="isPrivate"
                                  title="${message(code: 'topic.isPrivate.label', default: 'Is Private')}"/>

                <g:sortableColumn property="name" title="${message(code: 'topic.name.label', default: 'Name')}"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${topicInstanceList}" status="i" var="topicInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td><g:link action="show"
                                id="${topicInstance.id}">${fieldValue(bean: topicInstance, field: "id")}</g:link></td>

                    <td>${fieldValue(bean: topicInstance, field: "createdBy")}</td>

                    <td><g:formatDate date="${topicInstance.dateCreated}"/></td>

                    <td><g:formatBoolean boolean="${topicInstance.isPrivate}"/></td>

                    <td>${fieldValue(bean: topicInstance, field: "name")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="paginateButtons">
        <g:paginate total="${topicInstanceTotal}"/>
    </div>
</div>