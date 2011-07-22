<%--
  Created by IntelliJ IDEA.
  User: gaurav
  Date: 21/7/11
  Time: 12:38 PM
  To change this template use File | Settings | File Templates.
--%>

<select name="stateList">
    <g:each in="${stateList1}">
        <option value="${it}">${it}</option>
    </g:each>
</select>