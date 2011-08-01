<table class="tablesorter">
    <thead>
    <tr>
        <th>Resource Heading</th>
        <th>Topic</th>
        <th>Resource Summary</th>
    </tr>
    </thead>
    <tbody>
    <g:each in='${resources}' var="userResource">
        <tr>
            <td>
                <g:link controller="resource" action="show"
                        id="${userResource?.resource?.id}">
                    ${userResource?.resource?.heading}</g:link></td>
            <td>${userResource?.resource?.topic?.name}</td>
            <td>${userResource?.resource?.summary}</td></tr>
    </g:each>
    </tbody>
</table>
<div class="paginateButtons">
<util:remotePaginate controller="user" action="readResourceList" total="${resourceListTotal}"
                     update="resourceListTemplateDivId" max="10" pageSizes="[10, 20, 50,100]"/>
</div>