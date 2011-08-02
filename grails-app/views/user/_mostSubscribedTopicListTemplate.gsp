<table class="tablesorter">
    <tr>
        <th>Topic</th>
        <th>Number of Subscribers</th>
    </tr>
    <g:each in="${mostSubscribedTopics}" var="topic">
        <tr>
            <td><g:link controller="topic" action="show" id="${topic?.first()?.id}">
                ${topic?.first()?.name}</g:link></td>
            <td>${topic?.last()}</td>
        </tr>
    </g:each>
</table>

<div class="paginateButtons">
    <util:remotePaginate controller="user" action="mostSubscribedTopicList" total="${mostSubscribedTopicsTotal}"
                         update="mostSubscribedTopicListTemplateDivId" max="10" pageSizes="[10, 20, 50,100]"/>
</div>