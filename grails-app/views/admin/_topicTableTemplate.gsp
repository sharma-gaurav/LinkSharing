<table>
    <thead>
    <tr>
        <th>Topic Name</th>
        <th>Date Created</th>
        <th>Created By</th>
        <th>Is it Private</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${topicList}" var="topic">
        <tr>
            <td><g:link controller="topic" action="show" id="${topic?.id}">${topic?.name}</g:link></td>
            <td>${topic?.dateCreated}</td>
            <td>${topic?.createdBy?.name}</td>
            <td>${topic?.isPrivate}</td>
        </tr>
    </g:each>
    </tbody>
</table>

<div class="paginateButtons">
    <util:remotePaginate controller="admin" action="topicListPopulate" total="${topicCount}"
                         update="topicTableTemplateId" max="10" pageSizes="[10, 20, 50,100]"/>
</div>