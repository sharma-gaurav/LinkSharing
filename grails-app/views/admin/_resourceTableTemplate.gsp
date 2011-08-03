<table>
    <thead>
    <tr>
        <th>Resource Heading</th>
        <th>Date Created</th>
        <th>Created By</th>
        <th>Topic</th>
        <th>Summary</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${resourceList}" var="resource">
        <tr>
            <td><g:link controller="resource" action="show" id="${resource?.id}">${resource?.heading}</g:link></td>
            <td>${resource?.dateCreated}</td>
            <td>${resource?.createdBy?.name}</td>
            <td>${resource?.topic?.name}</td>
            <td>${resource?.summary}</td>
        </tr>
    </g:each>
    </tbody>
</table>

<div class="paginateButtons">
    <util:remotePaginate controller="admin" action="resourceListPopulate" total="${resourceCount}"
                         update="resourceTableTemplateId" max="10" pageSizes="[10, 20, 50,100]"/>
</div>