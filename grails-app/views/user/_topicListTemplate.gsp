<table class="tablesorter">
    <tr>
        <th>Topic Name</th>
    </tr>
    <g:each in="${topicsList}" var="topic">
        <tr>
            <td><g:link controller="topic" action="show"
                        id="${topic.topic.id}">${topic.topic?.name}</g:link></td>
        </tr>
    </g:each>
</table>

<div class="paginateButtons">
    <util:remotePaginate controller="user" action="topicList" total="${topicListTotal}"
                         update="topicListTemplateDivId" max="10" pageSizes="[10, 20, 50,100]"/>
</div>