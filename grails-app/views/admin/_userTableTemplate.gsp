<table>
    <thead>
    <tr>
        <th>Name</th>
        <th>User Name</th>
        <th>Password</th>
        <th>E-Mail ID</th>
        <th>Address</th>
        <th>Telephone No</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${userList}" var="user">
        <tr>
            <td>${user?.name}</td>
            <td>${user?.userName}</td>
            <td>${user?.password}</td>
            <td>${user?.email}</td>
            <td>${user?.address}</td>
            <td>${user?.phoneNumber}</td>
        </tr>
    </g:each>
    </tbody>
</table>

<div>
    <util:remotePaginate controller="admin" action="userListPopulate" total="${userCount}"
                         update="userTableTemplateId" max="10" pageSizes="[10,20,50,100]"/>
</div>