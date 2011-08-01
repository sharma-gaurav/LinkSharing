<table class="tablesorter">
    <tr>
        <th>Resource Name</th>
        <th>Read by Number of User</th>
    </tr>
    <g:each in="${mostReadResources}" var="resource">
        <tr>
            <td><g:link controller="resource" action="show" id="${resource?.first()?.id}">
                ${resource?.first()?.heading}</g:link></td>
            <td>${resource?.last()}</td>
        </tr>
    </g:each>
</table>
<div class="paginateButtons">
<util:remotePaginate controller="user" action="mostReadResourceList" total="${mostReadResourcesTotal}"
                     update="mostReadResourceListTemplateDivId" max="10" pageSizes="[10, 20, 50,100]"/>
</div>